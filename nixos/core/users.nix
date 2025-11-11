{
  pkgs,
  username,
  ...
}:
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
      "openrazer"
      "adbusers"
    ];
    shell = pkgs.zsh;
  };

  users.users.root = {
    shell = pkgs.zsh;
  };

  nix.settings.allowed-users = [ "${username}" ];
}
