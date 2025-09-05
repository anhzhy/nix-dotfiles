{ pkgs, ... }:
{
  system.autoUpgrade = {
    enable = true;
    operation = "boot";
    flags = [
      "--update-input"
      "nixpkgs"
      "--update-input"
      "rust-overlay"
      "--commit-lock-file"
    ];
    dates = "weekly";
    # channel = "https://nixos.org/channels/nixos-unstable";
  };

  systemd.user.services.hyprpolkitagent = {
    description = "Hyprpolkitagent - Polkit authentication agent";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  systemd.timers.kbd_raw_timer.timerConfig.AccuracySec = "1s";
  systemd.services.kbd_raw_timer = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "oneshot";
    # every 5 seconds
    startAt = "*:*:00/5";
    # set keyboard mode to raw, as a "solution" to gnome using alt and super keys to switch between the 7 ttys
    script = "${pkgs.kbd}/bin/kbd_mode -s";
  };

  systemd.settings.Manager = {
    RebootWatchdogSec = "1min";
    RuntimeWatchdogSec = "0";
    DefaultTimeoutStopSec = "20s";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
