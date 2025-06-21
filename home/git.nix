{ pkgs, username, ... }:
{
  programs.git = {
    enable = true;

    userName = "anhzhy";
    userEmail = "anzi.nguyen.vn@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      pull.ff = "only";
      color.ui = true;
      core.excludesFile = "/home/${username}/.config/git/.gitignore";
    };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = false;
        diff-so-fancy = true;
        navigate = true;
      };
    };
  };

  home.packages = with pkgs; [ gh ]; # pkgs.git-lfs

  xdg.configFile."git/.gitignore".text = ''
    .vscode
  '';
}