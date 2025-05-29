{ pkgs, ... }:
{
  services = {
    # Mount, trash, and other functionalities
    gvfs.enable = true;

    # Thumbnail support for images
    tumbler.enable = true;

    # Managing passwords, keys, and secrets securely
    gnome.gnome-keyring.enable = true;

    # Allow remote SSH access to the machine
    openssh.enable = true;

    # Handling device events and hotplugging
    udev.enable = true;

    # Filesystem for environment variables
    envfs.enable = true;

    # Discard unused blocks on SSDs, improving performance and longevity
    fstrim = {
      enable = true;
      interval = "weekly";
    };

    # Input device management
    libinput.enable = true;

    # RPC program numbers to network addresses
    rpcbind.enable = false;

    # Sharing files over the network
    nfs.server.enable = false;

    # Firmware updates on supported hardware devices
    fwupd.enable = true;

    dbus = {
      enable = true;
      packages = with pkgs; [
        gcr
        gnome-settings-daemon
      ];
    };
  };
}
