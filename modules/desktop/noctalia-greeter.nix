{ inputs, pkgs, ... }:

{
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];

  nixpkgs.overlays = [
    inputs.noctalia-greeter.overlays.default
  ];

  environment = {
    systemPackages = [ pkgs.bibata-cursors ];

    variables = {
      XCURSOR_THEME = "Bibata-Modern-Classic";
      XCURSOR_SIZE = 24;
    };
  };

  programs.noctalia-greeter.enable = true;

  security.polkit.trustedPrograms = [
    "${pkgs.noctalia-greeter}/bin/noctalia-greeter-apply-appearance"
  ];
}
