{ config, lib, theme, ... }:
{
  options.chromium.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable chromium";
  };
  config = lib.mkIf config.chromium.enable {
    programs.chromium = {
      enable = true;
      commandLineArgs = lib.optionals (theme.variant == "dark") [
        "--force-dark-mode"
      ];
      extraOpts = {
        MetricsReportingEnabled = false;
        BrowserSignin = 0;
        SyncDisabled = true;
        SearchSuggestEnabled = false;
        SafeBrowsingProtectionLevel = 1;
        AlternateErrorPagesEnabled = false;
        SpellCheckServiceEnabled = false;
        UrlKeyedAnonymizedDataCollectionEnabled = false;
        PromotionalTabsEnabled = false;
        WelcomePageOnOSUpgradeEnabled = false;
      };
    };
  };
}
