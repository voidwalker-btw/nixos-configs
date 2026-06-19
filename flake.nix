{
  description = "My Amazing Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };  
    

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nur, mangowm, ... }@inputs: {
    nixosConfigurations.nix-btw = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
	mangowm.nixosModules.mango
      { 
        nixpkgs.overlays = [
          nur.overlays.default
        ];  
      } 
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.voidwalker = { pkgs, config, inputs, ... }: {
            home.stateVersion = "26.05";

            programs.home-manager.enable = true;
            home.packages = with pkgs; [
            home-manager
            btop
            fastfetch
            waybar
            pavucontrol
            nix-search-tv
            dysk
            zenity
            unzip
            eza
            bat
            nerdfetch
            nixd 
            alejandra
            yazi
            nix-search-cli
            jq
            asciiquarium
            pcmanfm
            cmatrix
            pfetch
          ];

          home.sessionVariables = {
            EDITOR = "nvim";
            BROWSER = "brave";
            QT_QPA_PLATFORM = "wayland";
          };
      

          xdg.configFile."wofi/style.css" = {
            source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/nixos-configs/wofi/style.css";
          };

          xdg.configFile."wofi/config" = {
            source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/nixos-configs/wofi/config";
          };

          home.pointerCursor = {
            name = "Bibata-Modern-Classic";
            package = pkgs.bibata-cursors;
            size = 24;
            gtk.enable = true;
            x11.enable = true;
          }; 
          };
        }
      ];
    };
  };
}
