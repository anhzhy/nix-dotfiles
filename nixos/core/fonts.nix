{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      material-symbols

      dejavu_fonts
      libertinus

      fira-code
      fira-code-symbols

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      roboto
      (google-fonts.override { fonts = [ "Inter" ]; })

      jetbrains-mono

      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = [ "Libertinus Serif" ];
      sansSerif = [ "Inter" ];
      monospace = [ "JetBrains Mono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
