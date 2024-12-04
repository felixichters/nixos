{config,lib,pkgs,...}:

{
	imports = [
		./hyprland/hyprland.nix 
		./sway/sway.nix
		./waybar.nix
	];
}
