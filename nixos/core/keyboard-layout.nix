{ ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.options = "grp:alt_shift_toggle";
    };
  };
}
