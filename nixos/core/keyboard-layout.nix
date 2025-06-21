{ pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
      # xkb.options = "grp:alt_shift_toggle";
      excludePackages = [ pkgs.xterm ];
    };
  };
}
