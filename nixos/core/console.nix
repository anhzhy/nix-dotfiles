{ config, pkgs, lib, ... }:
{
  console = {
    font = "${pkgs.terminus_font}/share/consolefonts/ter-124b.psf.gz";
    earlySetup = true;
    keyMap = "us";
    packages = with pkgs; [ terminus_font ];
  };
}