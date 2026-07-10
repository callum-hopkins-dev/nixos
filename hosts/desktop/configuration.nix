{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules
    ../../users
  ];

  networking.hostName = "desktop";

  hardware.graphics.intel.enable = true;

  services.xserver.output = {
    name = "DP-1";

    mode = {
      framerate = 74.973;
      width = 1920;
      height = 1080;
    };
  };

  nix.settings.cores = 8;

  system.stateVersion = "26.05";
}
