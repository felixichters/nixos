{config, lib, pkgs, ...}:

{
  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    main = {
      font = lib.mkForce "JetBrainsMono:size=11";
    };
  };
  
  programs.fzf.enable = true;

  programs.ranger.enable = true;

  services.dunst.enable = true;

  programs.feh.enable = true;

  programs.zathura.enable = true;

  programs.htop.enable = true;

	programs.neovim = { 
		enable = true;
	};

  home.packages = with pkgs; [
    neofetch
    zip
    unzip
    spotify
    gtk3-x11
  ];
}