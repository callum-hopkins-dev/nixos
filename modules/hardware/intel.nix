{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.hardware.graphics.intel.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Intel graphics drivers.";
  };

  config = lib.mkIf config.hardware.graphics.intel.enable {
    boot.kernelParams = [ "i915.enable_guc=3" ];

    services.xserver.videoDrivers = [ "modesetting" ];

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;

        extraPackages = [
          pkgs.intel-media-driver
          pkgs.intel-vaapi-driver
          pkgs.vpl-gpu-rt
          pkgs.intel-compute-runtime
        ];
      };

      enableRedistributableFirmware = true;
    };

    environment = {
      systemPackages = [ pkgs.intel-gpu-tools ];

      sessionVariables = {
        LIBVA_DRIVER_NAME = "iHD";
      };
    };
  };
}
