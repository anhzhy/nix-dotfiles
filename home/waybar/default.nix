{ ... }:
{
  imports = [

  ];

  xdg.configFile."waybar/modules".source = ./modules;
  xdg.configFile."waybar/scripts".source = ./scripts;
}
