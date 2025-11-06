{ inputs, ... }:
{
  vscode-extensions = inputs.nix-vscode-extensions.overlays.default;

  gromit-mpx = (
    final: super: {
      gromit-mpx = super.gromit-mpx.overrideAttrs (oldAttrs: {
        cmakeFlags = (oldAttrs.cmakeFlags or [ ]) ++ [
          "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
        ];
      });
    }
  );

  hyprland = (
    final: super: {
      hypr = super.hypr.overrideAttrs (oldAttrs: {
        cmakeFlags = (oldAttrs.cmakeFlags or [ ]) ++ [
          "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
        ];
      });
    }
  );
}
