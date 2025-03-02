{config, pkgs, lib, ...}:

{
	options.gaming.enable = lib.mkOption {
		type = lib.types.bool;
		default = false;
		description = "enable gaming optimized setup";
	};

	config = lib.mkIf config.gaming.enable {
		programs.steam = {
			enable = true;
			remotePlay.openFirewall = true; 
			dedicatedServer.openFirewall = true; 
			localNetworkGameTransfers.openFirewall = true;
			gamescopeSession.enable = true;
		};
		environment.systemPackages = with pkgs; [
			mangohud
		];
		programs.gamemode.enable = true;
	};
}
