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
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      settings = {
        device = "laptop"; # desktop | laptop
        locale = "en_US.UTF-8";
        graphic = "hybrid"; # hybrid | nvidia | intel | amd
        desktop = "hyprland"; # hyprland | plasma
        username = "huyna";
        hostname = "nixos";
        terminal = "kitty";
        file-manager = "thunar";
      };

      lib = nixpkgs.lib // home-manager.lib;
      system = "x86_64-linux";
      overlays = builtins.attrValues (import ./overlays { inherit inputs outputs; });
      config = {
        allowBroken = true;
        allowUnfree = true;
      };
    in
    {
      templates = import ./dev-shells;
      overlays = overlays;
      config = config;

      nixosConfigurations = {
        laptop = lib.nixosSystem {
          system = system;
          modules = [ ./hosts/laptop ];
          specialArgs = {
            inherit self inputs outputs;
          }
          // settings;
        };
        desktop = lib.nixosSystem {
          system = system;
          modules = [ ./hosts/desktop ];
          specialArgs = {
            inherit self inputs outputs;
          }
          // settings;
        };
      };

      homeConfigurations.${settings.username} = lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          overlays = overlays;
          config = config;
        };
        modules = [ ./home ];
        extraSpecialArgs = {
          inherit self inputs outputs;
        }
        // settings;
      };
    };
}
