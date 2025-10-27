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
			settings = {
				user = {
					name  = "Felix";
					email = "f.ichters@proton.me";
				};
				init.defaultBranch = "main";
			};
		};
	};	
}
