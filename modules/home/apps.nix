{config,lib,pkgs,...}:

{
  options.apps.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "enable extra desktop apps";
  };

  config = lib.mkIf config.apps.enable {
    programs.obsidian = {
      enable = true;
    };
    home.packages = with pkgs; [
      dolphin-emu
      #gnugo
      xournalpp
      #libreoffice
    ];
  };
}
