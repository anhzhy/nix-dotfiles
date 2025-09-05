{
  description = "NixOS/anhzhy";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      username = "huyna";
      hostname = "nixos";
      device = "laptop";
      system = "x86_64-linux";
    in
    {
      templates = import ./dev-shells;
      nixosConfigurations = {
        "${hostname}" = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit
              self
              inputs
              hostname
              username
              device
              ;
          };
          modules = [ ./hosts/${hostname} ];
        };
      };
    };
}
