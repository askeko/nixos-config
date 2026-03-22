#!/usr/bin/env bash
THEME_DIR="$HOME/.config/theme"

if [ -f "$THEME_DIR/active-wallpaper" ]; then
  WALL=$(cat "$THEME_DIR/active-wallpaper")
elif [ -f "$THEME_DIR/active" ]; then
  THEME=$(cat "$THEME_DIR/active")
  # shellcheck source=/dev/null
  [ -f "$THEME_DIR/palettes/$THEME" ] && source "$THEME_DIR/palettes/$THEME"
  WALL="${WALLPAPER:-}"
fi

[ -n "${WALL:-}" ] && [ -f "$WALL" ] && {
  mkdir -p "$THEME_DIR/current"
  ln -sf "$WALL" "$THEME_DIR/current/wallpaper"
  hyprctl hyprpaper wallpaper ",$WALL"
} 2>/dev/null || true
