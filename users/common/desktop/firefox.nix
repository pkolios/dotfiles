{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.enc = {
      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        keepassxc-browser
      ];

      settings = {
        "apz.gtk.kinetic_scroll.enabled" = "true";
        "apz.overscroll.enabled" = "true";
        "apz.gtk.pangesture.enabled" = "true";
        "browser.aboutConfig.showWarning" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.topSitesRows" = 2;
        "browser.tabs.warnOnClose" = true;
        "general.smoothScroll.mouseWheel.durationMaxMS" = 500;
        "general.smoothScroll.mouseWheel.durationMinMS" = 250;
        "mousewheel.acceleration.start" = 1;
        "mousewheel.default.delta_multiplier_x" = 20;
        "mousewheel.default.delta_multiplier_y" = 20;
        "mousewheel.default.delta_multiplier_z" = 20;
        "privacy.trackingprotection.enabled" = true;
        "toolkit.telemetry.pioneer-new-studies-available" = false;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
      };
    };
  };
}
