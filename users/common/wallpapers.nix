{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.file.".config/wallpapers" = {
    recursive = true;
    source = ./wallpapers;
  };

  systemd.user.services.rotate-wallpapers = {
    Unit = {
      Description = "Rotate GNOME wallpaper";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      Type = "oneshot";
      Environment = [
        "WALLPAPER_DIR=${config.home.homeDirectory}/.config/wallpapers"
      ];
      ExecStart = "${pkgs.writeShellScript "rotate-wallpaper" ''
        #!/run/current-system/sw/bin/bash
        selection=$(find -L $WALLPAPER_DIR -type f -name "*.jpg" -o -name "*.png" | shuf -n1)
        gsettings set org.gnome.desktop.background picture-uri "file://$selection"
        gsettings set org.gnome.desktop.background picture-uri-dark "file://$selection"
      ''}";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
  systemd.user.timers.rotate-wallpapers = {
    Unit = {
      Description = "Timer: rotate GNOME wallpaper";
    };

    Timer = {
      OnCalendar = "hourly";
      Persistent = true;
    };

    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
