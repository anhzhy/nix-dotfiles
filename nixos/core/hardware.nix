{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bluez
    bluez-tools
    openrazer-daemon
    polychromatic
  ];

  services.blueman.enable = true;
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
      # enable = true;
      wireless.enable = true;
      wireless.enableGraphical = true;
    };

    openrazer = {
      enable = true;
    };

    brillo.enable = true;
    enableRedistributableFirmware = true;
  };
}
