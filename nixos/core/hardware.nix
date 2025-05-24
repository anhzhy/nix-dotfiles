{ config, ... }: 
{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          DiscoverableTimeout = 0;
          Discoverable = true;
          AlwaysPairable = true;
          # Experimental = true;
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };

    logitech = {
      wireless = {
        enable = true;
        enableGraphical = true;
      };
    };
  };

  services.blueman.enable = true;
  hardware.enableRedistributableFirmware = true;
}

