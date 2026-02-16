{config, pkgs, lib, ...}:
let
  llama-cpp = pkgs.llama-cpp;
  llama-server = lib.getExe' llama-cpp "llama-server";
in
{
  environment.systemPackages = [llama-cpp];
  services.llama-swap = {
    enable = true;
    port = 8080;
    openFirewall = false;
    settings = {
      models = {
        "qwen2.5-coder-7b-instruct-q4_k_m" = {
          cmd = ''${llama-server} \
            --port ''${PORT} \
            -m /mnt/stash/models/qwen2.5-coder-7b-instruct-q4_k_m.gguf \
            -c 4096 \
            --no-webui'';
          aliases = [  
            "qwen-coder"
          ];
        };
        "Qwen2.5-Coder-7B-Instruct-abliterated-Q4_K_M" = {
          cmd = ''${llama-server} 
            --port ''${PORT} \ 
            -m /mnt/stash/models/Qwen2.5-Coder-7B-Instruct-abliterated-Q4_K_M.gguf \ 
            -c 4096 \
            --no-webui'';
          aliases = [
            "qwen-coder-abliterated"
          ];
        };
      };
    };
  };
}
