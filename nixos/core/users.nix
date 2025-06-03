{ pkgs, username, ... }:
{
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "bluetooth"
      "docker"
      "input"
      "games"
      "video"
      "audio"
      "pipewire"
    ];
    shell = pkgs.zsh;
  };

  users.users.root = {
    shell = pkgs.zsh;
  };

  systemd.user.services = {
    dbus.serviceConfig.ExecStart = "${pkgs.dbus}/bin/dbus-daemon --session --print-address=3 --nofork";
  };

  nix.settings.allowed-users = [ "${username}" ];
}
