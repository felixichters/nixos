{ config, pkgs, lib, ... }:

{  
	services.postgresql = {
    enable = true;
    ensureDatabases = [ "mydatabase" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
  };
	programs.zsh.enable = true;
	users.defaultUserShell = pkgs.zsh;
	programs.light.enable = true;
}
