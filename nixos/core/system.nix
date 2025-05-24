{ ... }:
{
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-25.05";
  };

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
  system.stateVersion = "25.05";
}
