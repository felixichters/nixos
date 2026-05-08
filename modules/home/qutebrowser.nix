{ config, lib, user, ... }:

{
  options.qutebrowser.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable qutebrowser";
  };

  config = lib.mkIf config.qutebrowser.enable {
    programs.qutebrowser = {
      enable = true;
      searchEngines = {
        DEFAULT = "https://www.google.com/search?q={}";
        ns = "https://search.nixos.org/packages?channel=unstable&query={}";
      };
      settings = {
        url.start_pages = [ "https://www.google.com" ];
        url.default_page = "https://www.google.com";
      };
      keyBindings = {
        normal = {
          ",p" = "spawn --userscript qute-keepassxc --key ${user.gpgKey}";
        };
        insert = {
          "<Ctrl-Shift-u>" = "spawn --userscript qute-keepassxc --key ${user.gpgKey}";
        };
      };
      quickmarks = {
        gh = "https://github.com";
        ds = "https://chat.deepseek.com";
        cl = "https://claude.ai/new";
        gm = "https://gemini.google.com/app";
        yt = "https://www.youtube.com/";
        moodle = "https://moodle.uni-heidelberg.de/";
        sogo = "https://sogo.uni-heidelberg.de/SOGo/";
        heico = "https://heico.uni-heidelberg.de/heiCO/";
        muesli = "https://muesli.mathi.uni-heidelberg.de/";
        mampf = "https://mampf.mathi.uni-heidelberg.de/";
      };
    };
  };
}
