{ inputs, pkgs, ... }:

{
  environment.systemPackages = [
    inputs.nx.packages.${pkgs.system}.default
  ];
}
