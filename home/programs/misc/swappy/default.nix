{ pkgs, ... }:
{
  xdg.configFile."swappy/config".text = ''
    [Default]
    save_dir=$HOME/Pictures/Screenshots
    save_filename_format=%Y%m%d-%H%M%S.png
    show_pannel=false
    line_size=5
    text-size=20
    paint_mode=brush
    early_exit=false
    fill_shape=false
  '';

  home.packages = with pkgs; [
    swappy
    grim
    slurp
  ];
}