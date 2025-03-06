{ config, pkgs, lib, ...}:

{
	options.git.enable = lib.mkOption {
		type = lib.types.bool;
		default = true; 
		description = "enable git";
	};

	config = lib.mkIf config.git.enable {
		programs.git = {
			enable = true;
			userName  = "felix";
			userEmail = "";
			extraConfig = {
				init.defaultBranch = "main";
			};
		};
	};	
}
