{ lib, ... }:
{
  services.automatic-timezoned.enable = true;
  services.geoclue2.geoProviderUrl = "https://api.beacondb.net/v1/geolocate";
  services.geoclue2.enableDemoAgent = lib.mkForce true;
  time.timeZone = lib.mkDefault "Asia/Ho_Chi_Minh";
}
