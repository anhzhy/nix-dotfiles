{ inputs, ... }:
{
  nixpkgs.overlays = [
    inputs.nix-vscode-extensions.overlays.default
    (import ./python-overlays.nix)
  ];
}
