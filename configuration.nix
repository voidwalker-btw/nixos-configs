
{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nix-btw"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Yekaterinburg";
 
  users.users.voidwalker = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "input" ]; 
    packages = with pkgs; [
      tree
    ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  documentation.man.enable = true;
  documentation.dev.enable = true; 

  services.displayManager.ly.enable = true;
  
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  environment.systemPackages = with pkgs; [
    wget
    neovim
    wofi
    alacritty
    fd
    ripgrep
    curl
    fzf
    waybar
    swaybg
    wl-clipboard
    git
    home-manager
    papirus-icon-theme
    swaylock
    swayidle
    firefox
  ];

  security.pam.services.swaylock = {};

  programs.nix-ld.enable = true;

  programs.mango.enable = true;


  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
  ];

  # system.copySystemConfiguration = true;

  system.stateVersion = "26.05";

}

