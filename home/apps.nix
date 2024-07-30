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

  programs.feh.enable = true;

  programs.zathura.enable = true;

  programs.htop.enable = true;

  services.amberol.enable = true;

  home.packages = with pkgs; [
    neofetch
		rofi-wayland
		#kickoff
		#tofi
		cmus
		wev
		zip
    unzip
    spotify
    qalculate-qt
  	prismlauncher
		whitesur-icon-theme
		xdg_utils
	];
}
