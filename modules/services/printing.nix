{ pkgs, ... }:

{
  services = {
    printing = {
      enable = true;

      drivers = with pkgs; [
        gutenprint
        hplip
      ];
    };

    avahi = {
      enable = true;
      openFirewall = true;
      nssmdns4 = true;
    };
  };
}
