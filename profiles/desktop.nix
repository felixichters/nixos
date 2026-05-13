{
  system = { lib, ... }: {
    swaylock.enable = lib.mkDefault true;
    audio.enable = lib.mkDefault true;
    graphics.enable = lib.mkDefault true;
  };

  home = { lib, ... }: {
    sway.enable = lib.mkDefault true;
    foot.enable = lib.mkDefault true;
    mako.enable = lib.mkDefault true;
    wmenu.enable = lib.mkDefault true;
    fonts.enable = lib.mkDefault true;
    apps.enable = lib.mkDefault true;
    qutebrowser.enable = lib.mkDefault true;
  };
}
