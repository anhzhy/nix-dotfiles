{ config, pkgs, username, ... }:

{
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    # shell = pkgs.zsh;
  };

  nix.settings.allowed-users = [ "${username}" ];
}
