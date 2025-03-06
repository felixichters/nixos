{config, lib, ...}: 
{
	options.firefox.enable = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "enable firefox";
	};
	config = lib.mkIf config.firefox.enable {
		programs.firefox = {
			enable = true;
			policies = {
				DisableTelemetry = true;
				DontCheckDefaultBrowser = true;
				DisableFirefoxAccounts = true;
				DefaultDownloadDirectory = "\${home}/Downloads";
				DisablePocket = true;
			};
			profiles.navi = {
				id = 0;
				search = {
					force = true;
					default = "DuckDuckGo";
					privateDefault = "DuckDuckGo";
					engines = {
						#"Google".metaData.hidden = true;
						"Bing".metaData.hidden = true;
						"Nix Packages" = {
							urls = [{
								template = "https://search.nixos.org/packages";
								params = [
									{ name = "type"; value = "packages"; }
									{ name = "query"; value = "{searchTerms}"; }
								];
							}];
							definedAliases = [ "@np" ];
						};
					};
				};
				settings = {
					"browser.startup.page" = "0";
					"browser.startup.homepage" = "about:blank";
					"browser.newtabpage.enabled" = "false";
					"browser.toolbars.bookmarks.visibility" = "true";
					"browser.urlbar.suggest.topsites" = "false";
					"browser.tabs.hoverPreview.enabled" = "false";
					"browser.uidensity" = "1";
					"browser.translations.automaticallyPopup" = "false";
					"browser.translations.enable" = "false";
					"browser.download.useDownloadDir" = "false";

					"signon.rememberSignons" = "false";
					"layout.spellcheckDefault" = "0";
					
					"network.cookie.cookieBehavior" = "1";
					"network.cookie.lifetimePolicy" = "2";
					"dom.event.clipboardevents.enabled" = "false";
					"geo.enabled" = "false";
					"media.navigator.enabled" = "false";
					"media.peerconnection.enabled" = "false";

					"privacy.resistFingerprinting" = "true";
					"privacy.trackingprotection.enabled" = "true";
					"privacy.firstparty.isolate" = "true";
					"privacy.trackingprotection.fingerprinting.enabled" = "true";
					"privacy.trackingprotection.cryptomining.enabled" = "true";
				};
			};
		};
	};
}
