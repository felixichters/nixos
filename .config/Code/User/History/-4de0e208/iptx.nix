{ config, pkgs, lib, ... }:

{
	imports = [
		./base/base.nix
		./session.nix
	];
}
