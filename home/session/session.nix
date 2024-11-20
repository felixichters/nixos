{config,lib,pkgs,...}:

{
	imports = [
		./hyprland/hyprland.nix 
		./sway/sway.nix
		./mako.nix
		./tools.nix
		./waybar.nix
	];
}
