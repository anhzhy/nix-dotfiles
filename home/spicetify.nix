{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify =
    let
      spicetifyPkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;

      enabledExtensions = with spicetifyPkgs.extensions; [
        adblock
        hidePodcasts
        shuffle
      ];
      enabledSnippets = with spicetifyPkgs.snippets; [
        rotatingCoverart
        pointer
      ];

      theme = spicetifyPkgs.themes.catppuccin;
      colorScheme = "mocha";
    };
}
