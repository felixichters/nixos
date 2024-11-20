{ config, lib, pkgs, ...}:

{
	options.session_tools.enable = lib.mkOption {
		type = lib.types.bool;
		default = true; 
		description = "enable session tools";
	};
	
	config = lib.mkIf config.session_tools.enable {
		services.udiskie.enable = true;
		services.udsikie.automount = true;
		programs.zathura.enable = true;  
		program.feh.enable = true; 
		
		home.packages = with pkgs; [
			libreoffice-qt
			rofi-wayland
			spotify
			qalculate-qt
			swaylock-effects
			bitwarden
		];
	};
}
