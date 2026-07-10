{ config, lib, ... }:

{
  options.hardware.graphics.nvidia.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable NVIDIA graphics drivers.";
  };

  config = lib.mkIf config.hardware.graphics.nvidia.enable {
    boot.blacklistedKernelModules = [ "nouveau" ];

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };

      nvidia = {
        modesetting.enable = true;
        open = false;
        package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
        nvidiaPersistenced = true;
        nvidiaSettings = true;

        powerManagement = {
          enable = true;
          finegrained = false;
        };
      };
    };
  };
}
