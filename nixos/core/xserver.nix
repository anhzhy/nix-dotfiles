{ username, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.options = "grp:alt_shift_toggle, caps:swapescape";
    };

    displayManager = {
      sddm.enable = true;
    };

    libinput = {
      enable = true;
    };
  };
}
