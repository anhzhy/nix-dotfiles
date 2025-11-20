{
  pkgs,
  username,
  ...
}:
{
  services = {
    gvfs.enable = true;
    tumbler.enable = true;
    gnome.gnome-keyring.enable = true;
    openssh.enable = true;
    udev.enable = true;
    envfs.enable = true;
    fstrim.enable = true;
    libinput.enable = true;
    rpcbind.enable = false;
    nfs.server.enable = false;
    fwupd.enable = true;
    flatpak.enable = false;
    dbus.enable = true;

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
