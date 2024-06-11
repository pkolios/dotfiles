{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.enc = {
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
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
