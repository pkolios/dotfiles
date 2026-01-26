{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    package = null; # Use Homebrew-installed Firefox, just manage profiles

    profiles.enc = {
      extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
        ublock-origin
        keepassxc-browser
      ];

      settings = {
        "browser.aboutConfig.showWarning" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.topSitesRows" = 2;
        "browser.tabs.warnOnClose" = true;
        "privacy.trackingprotection.enabled" = true;
        "toolkit.telemetry.pioneer-new-studies-available" = false;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
      };
    };
  };
}
