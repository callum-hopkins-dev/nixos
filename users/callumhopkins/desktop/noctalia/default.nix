{ inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default

    ./lockscreen.nix
    ./bar.nix
    ./shell.nix
    ./control-center.nix
    ./power.nix
    ./plugins
  ];

  programs.noctalia.enable = true;
}
