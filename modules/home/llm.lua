-- Local LLM copilot backed by Ollama.

local M = {}

local cfg = {
  host = "http://localhost:11434",
  model = "qwen2.5-coder:7b",
}

local ns = vim.api.nvim_create_namespace("llm")

local function notify(msg, level)
  vim.notify("LLM: " .. msg, level or vim.log.levels.INFO)
end

local function system_prompt(filetype)
  local lang = filetype ~= "" and filetype or "plain text"
  return table.concat({
    "You are a code generator for " .. lang .. ".",
    "Implement EXACTLY what is asked and nothing more.",
    "Do the literal, minimal thing: if asked for an empty main function, emit an empty main function; do not fill it with example or hello-world code.",
    "Do not add helper functions, extra methods, error handling, comments, logging, tests, or example usage unless explicitly requested.",
    "Do not invent requirements or anticipate future needs.",
    "Output ONLY the requested code, ready to paste into a source file.",
    "No explanations, no prose, no surrounding markdown code fences.",
    "Do not wrap the output in ```.",
  }, " ")
end

local function strip_fences(text)
  local lines = vim.split(text, "\n", { plain = true })
  if lines[1] and lines[1]:match("^%s*```") then
    table.remove(lines, 1)
  end
  if lines[#lines] and lines[#lines]:match("^%s*```%s*$") then
    table.remove(lines, #lines)
  end
  while lines[1] and lines[1]:match("^%s*$") do
    table.remove(lines, 1)
  end
  while lines[#lines] and lines[#lines]:match("^%s*$") do
    table.remove(lines, #lines)
  end
  return lines
end

local function place(buf, srow, erow, lines)
  vim.api.nvim_buf_set_lines(buf, srow, erow, false, lines)
  if #lines > 0 then
    vim.api.nvim_buf_call(buf, function()
      vim.cmd(("silent %d,%dnormal! =="):format(srow + 1, srow + #lines))
    end)
  end
end

local function request(opts, on_result)
  local prompt = opts.instruction
  if opts.block and opts.block ~= "" then
    prompt = opts.instruction
      .. "\n\nApply this to the following code and return the full revised code:\n"
      .. opts.block
  end

  local body = vim.json.encode({
    model = cfg.model,
    system = system_prompt(opts.filetype),
    prompt = prompt,
    stream = false,
    options = { temperature = 0.1 },
  })

  notify("thinking…")

  vim.system({
    "curl", "-s", "--fail-with-body",
    cfg.host .. "/api/generate",
    "-H", "Content-Type: application/json",
    "-d", "@-",
  }, { stdin = body, text = true }, function(res)
    vim.schedule(function()
      if res.code ~= 0 then
        notify("request failed: " .. (res.stderr ~= "" and res.stderr or res.stdout), vim.log.levels.ERROR)
        return
      end
      local ok, decoded = pcall(vim.json.decode, res.stdout)
      if not ok or type(decoded) ~= "table" or not decoded.response then
        notify("could not parse response", vim.log.levels.ERROR)
        return
      end
      local lines = strip_fences(decoded.response)
      if #lines == 0 then
        notify("empty response", vim.log.levels.WARN)
        return
      end
      on_result(lines)
      notify("done")
    end)
  end)
end

local function buf_gone()
  notify("buffer is gone, discarding result", vim.log.levels.WARN)
end

function M.inline()
  local buf = vim.api.nvim_get_current_buf()
  local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
  local line = vim.api.nvim_get_current_line()
  local instruction = line:match("llm:%s*(.+)$")
  if not instruction or instruction == "" then
    notify("no `llm:` comment on this line", vim.log.levels.WARN)
    return
  end
  local mark = vim.api.nvim_buf_set_extmark(buf, ns, lnum, 0, {})

  request({ instruction = instruction, filetype = vim.bo[buf].filetype }, function(lines)
    if not vim.api.nvim_buf_is_valid(buf) then
      return buf_gone()
    end
    local row = vim.api.nvim_buf_get_extmark_by_id(buf, ns, mark, {})[1]
    place(buf, row, row + 1, lines)
    vim.api.nvim_buf_del_extmark(buf, ns, mark)
  end)
end

local function command(o)
  local instruction = o.args
  if instruction == "" then
    instruction = vim.fn.input("LLM: ")
  end
  if instruction == nil or instruction == "" then
    return
  end

  local buf = vim.api.nvim_get_current_buf()
  local opts = { instruction = instruction, filetype = vim.bo[buf].filetype }

  if o.range > 0 then
    local block = vim.api.nvim_buf_get_lines(buf, o.line1 - 1, o.line2, false)
    opts.block = table.concat(block, "\n")
    local sm = vim.api.nvim_buf_set_extmark(buf, ns, o.line1 - 1, 0, {})
    local em = vim.api.nvim_buf_set_extmark(buf, ns, o.line2 - 1, 0, {})
    request(opts, function(lines)
      if not vim.api.nvim_buf_is_valid(buf) then
        return buf_gone()
      end
      local srow = vim.api.nvim_buf_get_extmark_by_id(buf, ns, sm, {})[1]
      local erow = vim.api.nvim_buf_get_extmark_by_id(buf, ns, em, {})[1]
      place(buf, srow, erow + 1, lines)
      vim.api.nvim_buf_del_extmark(buf, ns, sm)
      vim.api.nvim_buf_del_extmark(buf, ns, em)
    end)
  else
    local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
    local mark = vim.api.nvim_buf_set_extmark(buf, ns, lnum, 0, {})
    request(opts, function(lines)
      if not vim.api.nvim_buf_is_valid(buf) then
        return buf_gone()
      end
      local row = vim.api.nvim_buf_get_extmark_by_id(buf, ns, mark, {})[1]
      place(buf, row + 1, row + 1, lines)
      vim.api.nvim_buf_del_extmark(buf, ns, mark)
    end)
  end
end

vim.api.nvim_create_user_command("Llm", command, { range = true, nargs = "*" })
vim.cmd("cnoreabbrev llm Llm")

return M
