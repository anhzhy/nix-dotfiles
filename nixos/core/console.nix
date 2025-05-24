{ config, pkgs, lib, ... }:
{
  console = {
    font = "ter-124b";
    earlySetup = false;
    keyMap = "us";
    packages = with pkgs; [ terminus_font ];
  };
}