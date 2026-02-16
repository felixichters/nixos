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
                openai-api-base = "http://127.0.0.1:8080/v1";
                openai-api-key = "dummy";

            };
        };
        home.packages = with pkgs; [
            #code-cursor
        ];
    };
}
