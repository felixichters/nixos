{ config, pkgs, lib, inputs, ... }:

{
	security.pam.services.swaylock = {};
	security.polkit.enable = true;
}
