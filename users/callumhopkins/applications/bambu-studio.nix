{ inputs, ... }:

{
  imports = [
    inputs.bambu-studio.homeModules.default
  ];

  programs.bambu-studio.enable = true;
}
