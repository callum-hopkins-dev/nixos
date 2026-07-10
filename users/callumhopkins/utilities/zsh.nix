{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    history = {
      size = 10000;
      ignoreAllDups = true;
      share = true;
    };

    shellAliases = {
      ll = "ls -la";
      gs = "git status";
      cat = "bat -pP";
    };

    initContent = ''
      dev() {
        nix develop $@ --command ${pkgs.zsh}/bin/zsh
      }

      shell() {
        nix-shell -p $@ --command ${pkgs.zsh}/bin/zsh
      }

      nixos-build() {
        sudo nixos-rebuild switch --flake ~/nixos-config#$(hostname)
      }

      nixos-update() {
        nix flake update --flake ~/nixos-config
        nixos-build
      }
    '';

    oh-my-zsh = {
      enable = true;

      theme = "robbyrussell";

      plugins = [
        "git"
        "sudo"
        "eza"
      ];
    };
  };
}
