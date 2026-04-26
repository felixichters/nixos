{config,lib,pkgs,...}:

{
  options.apps.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable extra desktop apps";
  };

  config = lib.mkIf config.apps.enable {
      home.packages = with pkgs; [
        spotify
        discord
        dolphin-emu
        #gnugo
        xournalpp
        #libreoffice
      ];
  };
}
