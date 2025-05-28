{ pkgs ? import <nixpkgs> {} }:

let
  python38 = pkgs.python38;
  python312 = pkgs.python312;
in

pkgs.mkShell {
  buildInputs = [
    python38
    python312
  ];

  shellHook = ''
    echo "Python 3.8 available as: $(which python3.8)"
    echo "Python 3.12 available as: $(which python3.12)"
    echo "Try: python3.8 --version or python3.12 --version"
  '';
}
