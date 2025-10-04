{
  pkgs,
  username,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    postgresql_15
    gvfs
    xfce.tumbler
    gnome-keyring
    openssh
    udev
    envfs
    util-linux
    libinput
    rpcbind
    nfs-utils
    fwupd
    dbus
  ];

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
        dconf
      ];
    };

    postgresql = {
      enable = true;
      package = pkgs.postgresql;
      ensureDatabases = [ "${username}" ];
      enableTCPIP = true;
      authentication = pkgs.lib.mkOverride 10 ''
        local all all trust
        host all all 127.0.0.1/32 trust
        host all all ::1/128 trust
      '';
      initialScript = pkgs.writeText "init-sql-script" ''
        CREATE ROLE ${username} WITH LOGIN PASSWORD '${username}' CREATEDB;
        CREATE DATABASE ${username};
        GRANT ALL PRIVILEGES ON DATABASE ${username} TO ${username};
      '';
    };
  };
}
