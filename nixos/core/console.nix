{ config, pkgs, lib, ... }:
{
  console = {
    font = "ter-124b";
    keyMap = "us";
    packages = with pkgs; [ terminus-font-psf ];
  };
}