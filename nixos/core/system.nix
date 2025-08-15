{ ... }:
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

  systemd.settings.Manager = {
    KExecWatchdogSec = "5min";
    RebootWatchdogSec = "10min";
    RuntimeWatchdogSec = "30s";
    WatchdogDevice = "/dev/watchdog";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
