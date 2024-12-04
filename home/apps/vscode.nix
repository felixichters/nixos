{ config, pkgs, lib, ...}:

{
	options.vscode.enable = lib.mkOption {
		type = lib.types.bool;
		default = false;
		description = "enable vscode";
	};

	config = lib.mkIf config.vscode.enable {
		
		programs.vscode = {
			enable = true;
			extensions = with pkgs.vscode-extensions; [
				#catppuccin.catppuccin-vsc 
				bbenoist.nix
				ms-vscode.cpptools-extension-pack
				#twxs.cmake
				#ms-vscode.cmake-tools
				emmanuelbeziat.vscode-great-icons
			];

			userSettings = {
				#"editor.fontFamily" = "JetBrains Mono Nerd Font";
				#"editor.fontSize" = 13;
				"editor.fontLigatures" = true;
				"editor.tabSize" = 2;
				"window.menuBarVisibility" = "toggle";
				#"workbench.colorTheme" = lib.mkForce "Solarized Dark";
				#"workbench.colorTheme" = lib.mkForce "Catppuccin Latte";
				"workbench.iconTheme" = "vscode-great-icons";
				#"catppuccin.accentColor" = "blue"; 
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
					key = "ctrl+h";
					command = "cursorLeft";
					when = "textInputFocus";
				}
				{
					key = "ctrl+j";
					command = "cursorDown";
					when = "textInputFocus";
				}
				{
					key = "ctrl+k";
					command = "cursorUp";
					when = "textInputFocus";
				}
				{
					key = "ctrl+l";
					command = "cursorRight";
					when = "textInputFocus";
				}

				{
					key = "alt+h";
					command = "cursorWordLeft";
					when = "textInputFocus";
				}
				{
					key = "alt+l";
					command = "cursorWordRight";
					when = "textInputFocus";
				}

				{
					key = "ctrl+shift+h";
					command = "cursorWordLeftSelect";
					when = "textInputFocus && editorTextFocus";
				}
				{
					key = "ctrl+shift+l";
					command = "cursorWordRightSelect";
					when = "textInputFocus && editorTextFocus";
				}
				{
					key = "ctrl+d";
					command = "editor.action.deleteLines";
					when = "textInputFocus";
				}
			];
		};
	};
}
