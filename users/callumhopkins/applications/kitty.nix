{ ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      enable_audio_bell = false;
      window_padding_width = 6;
      confirm_os_window_close = 0;
      disable_ligatures = "always";
    };
  };
}
