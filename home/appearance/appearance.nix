{config,lib,pkgs,...}:
{
	imports = [
		./font.nix
	];
	#home.pointerCursor = {
	#  name = “phinger-cursors-light”;
	#  package = pkgs.phinger-cursors;
	#  size = 32;
	#  gtk.enable = true;
	#};
}
