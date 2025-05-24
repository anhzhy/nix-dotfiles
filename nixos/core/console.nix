{ config, pkgs, lib, ... }:
{
  console = {
    font = "${pkgs.terminus_font}/share/consolefonts/ter-120n.psf.gz";
    packages = [ pkgs.terminus_font ];
    earlySetup = false;
  };
}