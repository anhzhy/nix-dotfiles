{ pkgs, lib, inputs, ... }:
{
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  boot = {
    consoleLogLevel = 0;
    initrd.verbose = false;
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "i915.modeset=1"
    ];
    loader.systemd-boot.enable = lib.mkForce false;
    initrd.systemd.enable = false;
  };

  environment.systemPackages = with pkgs; [sbctl];
}
