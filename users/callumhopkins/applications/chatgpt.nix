{ pkgs, lib, ... }:

let
  chatgpt = pkgs.stdenv.mkDerivation {
    pname = "chatgpt";
    version = "latest-2026-09-06";

    src = pkgs.fetchurl {
      url = "https://persistent.oaistatic.com/codex-app-prod/linux/deb/latest/chatgpt_amd64.deb";
      sha256 = "sha256-YlgBiNh8PTqTadq3xztCqKMlGNTfii1brmRm3erFwF4=";
    };

    nativeBuildInputs = [
      pkgs.dpkg
      pkgs.autoPatchelfHook
    ];

    buildInputs = [
      pkgs.stdenv.cc.cc

      pkgs.alsa-lib
      pkgs.at-spi2-atk
      pkgs.at-spi2-core
      pkgs.cairo
      pkgs.cups
      pkgs.dbus
      pkgs.expat
      pkgs.gdk-pixbuf
      pkgs.glib
      pkgs.gtk3
      pkgs.libgbm
      pkgs.libusb1
      pkgs.libx11
      pkgs.libxcb
      pkgs.libxcomposite
      pkgs.libxdamage
      pkgs.libxext
      pkgs.libxfixes
      pkgs.libxkbcommon
      pkgs.libxrandr
      pkgs.nspr
      pkgs.nss
      pkgs.pango
      pkgs.systemd
      pkgs.vulkan-loader
    ];

    autoPatchelfIgnoreMissingDeps = [
      "libc.musl-x86_64.so.1"
    ];

    unpackPhase = ''
      dpkg-deb -x $src .
    '';

    installPhase = ''
      mkdir -p $out
      cp -r usr/* $out/
    '';

    preFixup = ''
      addAutoPatchelfSearchPath ${lib.getLib pkgs.libsForQt5.qtbase}/lib
      addAutoPatchelfSearchPath ${lib.getLib pkgs.qt6.qtbase}/lib
    '';

    meta = {
      description = "Bring ChatGPT to your desktop with ChatGPT Work and Codex, plus context from your email, screenshots, files, and anything on your screen.";
      homepage = "https://chatgpt.com/";
      license = lib.licenses.unfree;
      mainProgram = "chatgpt";
      platforms = [ "x86_64-linux" ];
    };
  };
in
{
  home.packages = [ chatgpt ];
}
