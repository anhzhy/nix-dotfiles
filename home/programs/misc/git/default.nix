{ pkgs, username, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user.name = "anhzhy";
      user.email = "anzi.nguyen.vn@gmail.com";

      init.defaultBranch = "main";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      pull.ff = "only";
      color.ui = true;
      core.excludesFile = "/home/${username}/.config/git/.gitignore";
    };
  };

  programs.delta = {
    enable = true;
    options = {
      line-numbers = true;
      side-by-side = false;
      diff-so-fancy = true;
      navigate = true;
    };
    enableGitIntegration = true;
  };

  home.packages = with pkgs; [ gh ]; # pkgs.git-lfs

  xdg.configFile."git/.gitignore".text = ''
    .vscode
  '';
}
