#!/bin/sh
case "$3" in
  plug)
    logger  "headphones plugged in!"
    sudo -u ezra XDG_RUNTIME_DIR="/run/user/$(id -u ezra)/" pactl set-card-profile "$(sudo -u ezra XDG_RUNTIME_DIR="/run/user/$(id -u ezra)/" pactl list short cards | cut -f2)" output:analog-stereo+input:analog-stereo
    ;;
  unplug)
    logger  "headphones unplugged!"
    sudo -u ezra XDG_RUNTIME_DIR="/run/user/$(id -u ezra)/" pactl set-card-profile "$(sudo -u ezra XDG_RUNTIME_DIR="/run/user/$(id -u ezra)/" pactl list short cards | cut -f2)" output:hdmi-stereo+input:analog-stereo
    ;;
  *)
    logger "ACPI action undefined: $3"
    ;;
esac
