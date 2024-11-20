{config, lib, pkgs, ...}:

{
	options.ranger.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable ranger";
	};
	config = lib.mkIf config.ranger.enable {
		programs.ranger = {
			enable = true;
		};
		xdg.configFile."ranger/rifle.conf".text = ''
			mime ^text,  label editor = nvim -- "$@"
			mime ^text,  label pager  = "$PAGER" -- "$@"
			!mime ^text, label editor, ext xml|json|csv|tex|py|pl|rb|js|sh|php = nvim -- "$@"
			!mime ^text, label pager,  ext xml|json|csv|tex|py|pl|rb|js|sh|php = "$PAGER" -- "$@"
			ext tex = code "$@"
			ext sh = nvim "$@" 
			ext py = code "$@"
			ext lua = nvim "$@"
			ext pdf = firefox "$@"
			ext jpg = feh "$@"
			ext jpeg = feh "$@"
			ext png = feh "$@"
			ext cpp = nvim "$@"
			ext nix = nvim "$@"
			ext h = nvim "$@"
			ext zip = unzip "$@"
		'';
	};
}
