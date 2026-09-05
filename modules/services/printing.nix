{ pkgs, ... }:

{
  services = {
    printing = {
      enable = true;

      drivers = with pkgs; [
        gutenprint
        (pkgs.hplip.override {
          withQt5 = false;
        })
      ];
    };

    avahi = {
      enable = true;
      openFirewall = true;
      nssmdns4 = true;
    };
  };
}
