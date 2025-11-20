{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default

    qt6.qtbase
    qt6.qtsvg
    qt6.qt5compat
    qt6.qtquick3d
    qt6.qtwayland
    qt6.qtmultimedia
    qt6.qtdeclarative
    qt6.qtimageformats
    qt6.qtpositioning

    libsForQt5.qt5.qtgraphicaleffects
    kdePackages.qt5compat
  ];

  # necessary environment variables
  environment.variables = {
    # QML_IMPORT_PATH = "${pkgs.qt6.qt5compat}/lib/qt-6/qml:${pkgs.qt6.qtbase}/lib/qt-6/qml";
    QML2_IMPORT_PATH = "${pkgs.qt6.qt5compat}/lib/qt-6/qml:${pkgs.qt6.qtbase}/lib/qt-6/qml";
  };

  # make sure the Qt application is working properly
  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QML_IMPORT_PATH = "${pkgs.hyprland-qt-support}/lib/qt-6/qml";
  };
}
