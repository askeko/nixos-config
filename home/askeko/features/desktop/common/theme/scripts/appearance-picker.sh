#!/usr/bin/env bash
choice=$(printf "Change theme\nChange wallpaper" | rofi -dmenu -p "Appearance")
case "$choice" in
  "Change theme") theme-picker ;;
  "Change wallpaper") wallpaper-picker ;;
esac
