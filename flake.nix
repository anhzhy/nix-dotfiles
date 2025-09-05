{
  description = "NixOS/anhzhy";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

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
      inherit (self) outputs;
      username = "huyna";
      hostname = "nixos";
      terminal = "kitty";
      file-manager = "thunar";
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      # pkgs = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {
      templates = import ./dev-shells;
      overlays = import ./overlays { inherit inputs; };
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          system = forAllSystems (system: system);
          specialArgs = {
            device = "laptop";
            inherit
              self
              inputs
              outputs
              username
              hostname
              terminal
              file-manager
              ;
          };
          modules = [ ./hosts/laptop ];
        };
        desktop = nixpkgs.lib.nixosSystem {
          system = forAllSystems (system: system);
          specialArgs = {
            device = "desktop";
            inherit
              self
              inputs
              outputs
              username
              hostname
              terminal
              file-manager
              ;
          };
          modules = [ ./hosts/desktop ];
        };
      };

      # homeConfigurations.default = {
      #   home-manager.lib.homeManagerConfiguration = {
      #     pkgs = pkgs;
      #     modules = [ ./home ];
      #     extraSpecialArgs = {
      #       inherit self inputs outputs;
      #     }
      #     // settings;
      #   };
      # };
    };
}
