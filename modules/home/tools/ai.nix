{config, pkgs, lib, ...}:

{
    options.ai.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "enable ai/llm tools";
    };
    config = lib.mkIf config.ai.enable {
        #services.ollama = {
        #    enable = true;
            #acceleration = "cuda";
        #};
        programs.aider-chat = {
            enable = true;
            settings = {
                dark-mode = true;
            };
        };
        home.packages = with pkgs; [
            #code-cursor
        ];
    };
}
