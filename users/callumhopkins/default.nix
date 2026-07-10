{ pkgs, ... }:

{
  users.users.callumhopkins = {
    isNormalUser = true;
    description = "Callum Hopkins";

    extraGroups = [
      "networkmanager"
      "wheel"
      "lp"
      "disk"
    ];

    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  home-manager.users.callumhopkins = import ./home.nix;
}
