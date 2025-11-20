{ pkgs, hostname, ... }:
{
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    iw
  ];

  networking = {
    hostName = "${hostname}";
    # wireless.enable = true;
    networkmanager.enable = true;
    networkmanager.wifi.powersave = true;
    enableIPv6 = false;
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
      "1.1.1.1"
      "1.1.0.0"
    ];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        57621
        59010
        59011
      ];
      allowedUDPPorts = [
        59010
        59011
      ];
    };
  };
}
