#!/usr/bin/env bash
PALETTE_DIR="$HOME/.config/theme/palettes"
CURRENT=$(cat "$HOME/.config/theme/active" 2>/dev/null || echo "none")

choice=$(ls "$PALETTE_DIR" | rofi -dmenu -p "Theme (current: $CURRENT)")
[ -n "$choice" ] && theme-switch "$choice"
