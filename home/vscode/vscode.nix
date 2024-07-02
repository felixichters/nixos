{ config, pkgs, lib, ...}:

{
	programs.vscode = {
  	enable = true;
  	extensions = with pkgs.vscode-extensions; [
   		catppuccin.catppuccin-vsc 
			catppuccin.catppuccin-vsc-icons
			bbenoist.nix
			ms-vscode.cpptools-extension-pack
			twxs.cmake
			ms-vscode.cmake-tools

  	];
	userSettings = {
		"editor.fontLigatures" = true;
		"editor.tabSize" = 2;
		"window.menuBarVisibility" = "toggle";
	};
	};
}