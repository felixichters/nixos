{config, pkgs, lib, ...}:
let
  #llama-cpp = pkgs.llama-cpp.override { rocmSupport = true; };
  llama-server = lib.getExe' llama-cpp "llama-server";
in
{
  environment.systemPackages = [llama-cpp]
  services.llama-swap = {
    enable = true;
    settings = {
      models = {
        "qwen2.5-coder" = {
          cmd = "${llama-server} --port ${PORT} -m /mnt/stash/models/ -ngl 0 -c 4096 --no-webui";
          aliases = [
            "qwen1"
          ];
        };

      };
    };
  };
}