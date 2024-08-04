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
				key = "alt+shift+j";
        command = "editor.action.insertCursorBelow";
        when = "editorTextFocus";
      }
			{
				key = "alt+shift+k";
        command = "editor.action.insertCursorAbove";
        when = "editorTextFocus";
      }

			{
      	key = "alt+h";
        command = "cursorDown";
        when = "textInputFocus";
      }
			{
      	key = "alt+j";
        command = "cursorDown";
        when = "textInputFocus";
      }
			{
      	key = "alt+k";
        command = "cursorDown";
        when = "textInputFocus";
      }
			{
      	key = "alt+l";
        command = "cursorDown";
        when = "textInputFocus";
      }
    ];
	};
}