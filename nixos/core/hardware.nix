{ config, ... }: 

{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };

    # opengl = {
    #   enable = true;
    #   driSupport = true;
    #   driSupport32Bit = true;
    # };

    logitech = {
      wireless = {
        enable = true;
        enableGraphical = true;
      };
    };
  };

  hardware.enableRedistributableFirmware = true;
}

