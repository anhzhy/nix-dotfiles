{ ... }:
{
  programs.zsh = {
    shellAliases = {
      # Utils
      cat = "bat";
      weather = "curl -s v2.wttr.in";

      ls = "eza --icons";
      ll = "eza --long";
      la = "eza --icons -a --group-directories-first -1";
      lla = "eza -a --group-directories-first -1 --no-user --long";
      lt = "eza --icons --tree --group-directories-first";

      # Nixos
      nix-switch = "nh os switch";
      nix-update = "nh os switch --update";
      nix-clean = "nh clean all --keep 3";
      nix-search = "nh search";
      nix-test = "nh os test";
    };
  };
}