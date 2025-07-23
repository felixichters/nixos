{pkgs, ...}:
{
	home.packages = with pkgs; [
		katago
		prismlauncher
	];
}
