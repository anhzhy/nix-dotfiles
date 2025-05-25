{ ... }:
{
  programs.zsh = {
    shellAliases = {
      # Utils
      cat = "bat";
      weather = "curl -s v2.wttr.in";

      ls = "eza --icons --group-directories-first -1";
      ll = "eza --long --group-directories-first -1";
      la = "eza --icons -a --group-directories-first -1";
      lla = "eza -a --group-directories-first -1 --no-user --long";
      lt = "eza --icons --tree --group-directories-first";

      # Nixos
      nix-switch = "nh os switch";
      nix-update = "nh os switch --update";
      nix-clean = "nh clean all --keep 3";
      nix-search = "nh search";
      nix-test = "nh os test";

      # Git
      g = "lazygit";
      gf = "onefetch --number-of-file-churns 0 --no-color-palette";
      ga = "git add";
      gaa = "git add --all";
      gs = "git status";
      gb = "git branch";
      gm = "git merge";
      gd = "git diff";
      gpl = "git pull";
      gplo = "git pull origin";
      gps = "git push";
      gpso = "git push origin";
      gpst = "git push --follow-tags";
      gcl = "git clone";
      gc = "git commit";
      gcm = "git commit -m";
      gcma = "git add --all && git commit -m";
      gtag = "git tag -ma";
      gch = "git checkout";
      gchb = "git checkout -b";
      glog = "git log --oneline --decorate --graph";
      glol = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'";
      glola = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all";
      glols = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat";
    };
  };
}