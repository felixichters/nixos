{ config, pkgs, lib, ... }:

{

	imports = [
		./lackluster.nix
		#./catppuccin.nix
	];

	# stylix = {
	#   enable = true;
	# 	#image = ./solid-color-image.jpeg;
	# 	
	# 	targets.waybar.enable = false;
	# 	targets.vim.enable = false;
	#
	#   cursor = {
	#     package = pkgs.phinger-cursors;
	#     name = "phinger-cursors-light";
	#     size = 30;
	#   };
	#   fonts = {
	#     monospace = {
	#       package = pkgs.fira-code;
	#       name = "Fira Code";
	#     };
	#     sansSerif = {
	#       package = pkgs.dejavu_fonts;
	#       name = "DejaVu Sans";
	#     };
	#     serif = {
	#       package = pkgs.dejavu_fonts;
	#       name = "DejaVu Serif";
	#     };
	#     sizes = {
	#       applications = 11;
	#       desktop = 9;
	#       terminal = 11;
	#     };
	#   }; 
	#   opacity = {
	#     applications = 1.0;
	#     terminal = 1.0;
	#     desktop = 1.0;
	#   };
	# };
}
