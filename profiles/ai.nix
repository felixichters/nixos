# Local LLM tooling (claude-code, etc.).
{
  home = { config, lib, ... }: {
    ai.enable = lib.mkDefault true;
  };
}
