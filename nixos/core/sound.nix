{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];

  services.pulseaudio.enable = lib.mkForce false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    lowLatency.enable = true;
  };

  hardware.alsa.enablePersistence = true;
  environment.systemPackages = with pkgs; [
    pamixer
    pavucontrol
  ];
}
