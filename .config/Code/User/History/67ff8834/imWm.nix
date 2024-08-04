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
			#"workbench.colorTheme" = lib.mkForce "Solarized Dark";
			"workbench.colorTheme" = lib.mkForce "Catppuccin Latte";
			"workbench.iconTheme" = "vscode-great-icons";
			"catppuccin.accentColor" = "blue"; 
		};
		keybindings = [
			{
      	key = "ctrl+y";
      	command = "editor.action.commentLine";
      	when = "editorTextFocus && !editorReadonly";
      }
    ];
	};
}