{ config, pkgs, lib, ... }:

{
	imports = [
		./base/base.nix
		./programs.nix
		./session.nix
	];

}
