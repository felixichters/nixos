{ config, pkgs, lib, ...}:

{
	programs.vscode = {
  	enable = true;
  	extensions = with pkgs.vscode-extensions; [
   		catppuccin.catppuccin-vsc 
			bbenoist.nix
			ms-vscode.cpptools-extension-pack
			twxs.cmake
			ms-vscode.cmake-tools
      emmanuelbeziat.vscode-great-icons
  	];
	userSettings = {
		"editor.fontLigatures" = true;
		"editor.tabSize" = 2;
		"window.menuBarVisibility" = "toggle";
		"workbench.colorTheme" = "Solarized Dark";
		#"workbench.colorTheme" = "Catppuccin Latte";
		"workbench.iconTheme" = "vscode-great-icons";
		"catppuccin.accentColor" = "blue"; 
	};
	};
}