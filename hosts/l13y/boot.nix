{pkgs, ...}:

{
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;	
	boot.kernelParams = ["quiet"];
	#boot.kernelParams = [ "console=tty1" ];
	services.greetd = {
		enable = true; 
		#vt = 2;
		settings = {                                                           
			default_session = {                                                  
				command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
				user = "greeter";                                                  
			};                                                                   
		};                                                                     
	};

}
