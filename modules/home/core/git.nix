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
			userName  = "Felix";
			userEmail = "f.ichters@proton.me";
			extraConfig = {
				init.defaultBranch = "main";
			};
		};
	};	
}
