{ pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.writeShellApplication {
      name = "nx";

      runtimeInputs = [
        pkgs.git
        pkgs.nix
        pkgs.hostname
        pkgs.delta
      ];

      text = builtins.readFile ./nx;
    })
  ];
}
