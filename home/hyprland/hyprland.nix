{config, lib, pkgs, ...}:

{
  imports = [
		./keybindings.nix
	];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = "waybar"
    };
    extraConfig = '' 
    ''
  };
}