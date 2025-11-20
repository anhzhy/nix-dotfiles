{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
  ];

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 4d --keep 3";
    };
    flake = "/home/${username}/nix-dotfiles";
  };
}
