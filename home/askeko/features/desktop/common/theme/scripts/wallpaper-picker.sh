#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
THEME_DIR="$HOME/.config/theme"
ACTIVE_WALLPAPER="$THEME_DIR/active-wallpaper"
CURRENT="$WALLPAPER_DIR"

ROFI_OPTS=(
  -dmenu -show-icons -i -p "Wallpaper"
  -theme-str 'element-icon { size: 12em; }'
  -theme-str 'element-text { vertical-align: 0.5; }'
  -theme-str 'listview { columns: 1; lines: 4; }'
  -theme-str 'window { width: 35%; }'
)

list_entries() {
  local dir="$1"

  if [ "$dir" = "$WALLPAPER_DIR" ]; then
    printf '%s\0icon\x1fpreferences-desktop-wallpaper\n' "Theme default"
  else
    printf '%s\0icon\x1fgo-up\n' ".."
  fi

  # Subdirectories
  while IFS= read -r -d '' d; do
    printf '%s\0icon\x1ffolder\n' "${d##*/}/"
  done < <(find "$dir" -mindepth 1 -maxdepth 1 -type d -print0 | sort -z)

  # Images with thumbnails
  while IFS= read -r -d '' img; do
    printf '%s\0icon\x1f%s\n' "${img##*/}" "$img"
  done < <(find "$dir" -mindepth 1 -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) -print0 | sort -z)
}

while true; do
  choice=$(list_entries "$CURRENT" | rofi "${ROFI_OPTS[@]}") || exit 0
  [ -z "$choice" ] && exit 0

  if [ "$choice" = "Theme default" ]; then
    rm -f "$ACTIVE_WALLPAPER"
    THEME=$(cat "$THEME_DIR/active" 2>/dev/null || echo "everforest-dark")
    # shellcheck source=/dev/null
    source "$THEME_DIR/palettes/$THEME"
    WALL="$WALLPAPER"
    break
  elif [ "$choice" = ".." ]; then
    CURRENT="$(dirname "$CURRENT")"
  elif [ -d "$CURRENT/${choice%/}" ]; then
    CURRENT="$CURRENT/${choice%/}"
  else
    WALL="$CURRENT/$choice"
    echo "$WALL" > "$ACTIVE_WALLPAPER"
    break
  fi
done

ln -sf "$WALL" "$THEME_DIR/current/wallpaper"
hyprctl hyprpaper wallpaper ",$WALL" 2>/dev/null || true

notify-send -a "Wallpaper" "Wallpaper changed" 2>/dev/null || true
