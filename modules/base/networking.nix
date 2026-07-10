{ pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;

    firewall = {
      enable = true;

      allowedUDPPorts = [
        27036
        1900
        2021
      ];

      allowedTCPPorts = [
        22
        27040
        9300
      ];
    };

    useDHCP = false;
  };

  users.groups.networkmanager = { };
}
