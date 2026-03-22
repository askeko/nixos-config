#!/usr/bin/env bash
set -euo pipefail

THEME="${1:-}"
THEME_DIR="$HOME/.config/theme"
PALETTE_DIR="$THEME_DIR/palettes"
CURRENT_DIR="$THEME_DIR/current"

if [ -z "$THEME" ]; then
  notify-send -u critical -a "Theme Switcher" "Error" "No theme specified" 2>/dev/null || true
  echo "Usage: theme-switch <theme-name>"
  exit 1
fi

PALETTE="$PALETTE_DIR/$THEME"
if [ ! -f "$PALETTE" ]; then
  notify-send -u critical -a "Theme Switcher" "Error" "Unknown theme: $THEME" 2>/dev/null || true
  echo "Unknown theme: $THEME"
  exit 1
fi

# shellcheck source=/dev/null
source "$PALETTE"

# Strip leading # from color values
BASE00="${BASE00#\#}"
BASE01="${BASE01#\#}"
BASE02="${BASE02#\#}"
BASE03="${BASE03#\#}"
BASE04="${BASE04#\#}"
BASE05="${BASE05#\#}"
BASE06="${BASE06#\#}"
BASE07="${BASE07#\#}"
BASE08="${BASE08#\#}"
BASE09="${BASE09#\#}"
BASE0A="${BASE0A#\#}"
BASE0B="${BASE0B#\#}"
BASE0C="${BASE0C#\#}"
BASE0D="${BASE0D#\#}"
BASE0E="${BASE0E#\#}"
BASE0F="${BASE0F#\#}"

mkdir -p "$CURRENT_DIR"
mkdir -p "$HOME/.config/dunst/dunstrc.d"

# Record active theme
echo "$THEME" > "$THEME_DIR/active"

# Foreground color file (for hyprlock inline commands)
echo "$BASE05" > "$CURRENT_DIR/fg-color"

# Waybar CSS
cat > "$CURRENT_DIR/waybar.css" <<EOF
@define-color background   #${BASE00};
@define-color background_alt #${BASE01};
@define-color foreground   #${BASE05};
@define-color blue         #${BASE0D};
@define-color cyan         #${BASE0C};
@define-color magenta      #${BASE0E};
@define-color yellow       #${BASE0A};
@define-color green        #${BASE0B};
@define-color red          #${BASE08};
@define-color white        #${BASE05};
@define-color orange       #${BASE09};
@define-color grey         #${BASE03};
@define-color light_grey   #${BASE04};
EOF

# Rofi RASI
cat > "$CURRENT_DIR/rofi.rasi" <<EOF
* {
    foreground:              #${BASE05};
    background-color:        #${BASE00};
    active-background:       #${BASE0D};
    active-foreground:       #${BASE00};
    urgent-background:       #${BASE08};
    urgent-foreground:       #${BASE00};
    bordercolor:             #${BASE0D};
    cyan:                    #${BASE0C};
    green:                   #${BASE0B};
    purple:                  #${BASE0E};
}
EOF

# Ghostty
cat > "$CURRENT_DIR/ghostty" <<EOF
theme = ${GHOSTTY_THEME}
EOF

# Kitty
cat > "$CURRENT_DIR/kitty.conf" <<EOF
foreground           #${BASE05}
background           #${BASE00}
selection_foreground #${BASE05}
selection_background #${BASE02}
cursor               #${BASE05}
cursor_text_color    #${BASE00}
url_color            #${BASE0D}
active_border_color  #${BASE08}
inactive_border_color #${BASE02}
scrollbar_handle_color #${BASE0D}
scrollbar_track_color  #${BASE01}
color0  #${BASE00}
color1  #${BASE08}
color2  #${BASE0B}
color3  #${BASE0A}
color4  #${BASE0D}
color5  #${BASE0E}
color6  #${BASE0C}
color7  #${BASE04}
color8  #${BASE03}
color9  #${BASE08}
color10 #${BASE0B}
color11 #${BASE0A}
color12 #${BASE0D}
color13 #${BASE0E}
color14 #${BASE0C}
color15 #${BASE05}
EOF

# Hyprland
cat > "$CURRENT_DIR/hyprland.conf" <<EOF
general:col.active_border = rgb(${BASE0D})
general:col.inactive_border = rgb(${BASE01})
EOF

# Hyprlock
cat > "$CURRENT_DIR/hyprlock.conf" <<EOF
\$outer_color = rgb(${BASE00})
\$inner_color = rgb(${BASE05})
\$font_color = rgb(${BASE00})
\$check_color = rgb(${BASE09})
\$fail_color = rgb(${BASE08})
\$text_color = rgba(${BASE05}ff)
EOF

# Pywalfox (Firefox)                                                                                                                                                                                        
mkdir -p "$HOME/.cache/wal"                                                                                                                                                                                 
cat > "$HOME/.cache/wal/colors.json" <<EOF
{               
  "wallpaper": "None",
  "alpha": "100",                                                                                                                                                                                           
  "special": {
    "background": "#${BASE00}",                                                                                                                                                                             
    "foreground": "#${BASE05}",                                                                                                                                                                             
    "cursor": "#${BASE05}"
  },                                                                                                                                                                                                        
  "colors": {                                                                                                                                                                                               
    "color0": "#${BASE00}",                                                                                                                                                                                 
    "color1": "#${BASE08}",                                                                                                                                                                                 
    "color2": "#${BASE0B}",                                                                                                                                                                                 
    "color3": "#${BASE0A}",
    "color4": "#${BASE0D}",
    "color5": "#${BASE0E}",                                                                                                                                                                                 
    "color6": "#${BASE0C}",
    "color7": "#${BASE05}",                                                                                                                                                                                 
    "color8": "#${BASE03}",
    "color9": "#${BASE08}",
    "color10": "#${BASE0B}",                                                                                                                                                                                
    "color11": "#${BASE0A}",                                                                                                                                                                                
    "color12": "#${BASE0D}",                                                                                                                                                                                
    "color13": "#${BASE0E}",                                                                                                                                                                                
    "color14": "#${BASE0C}",                                                                                                                                                                                
    "color15": "#${BASE07}"                                                                                                                                                                                 
  }                                                                                                                                                                                                         
}                                                                                                                                                                                                           
EOF

# Dunst (drop-in override)
cat > "$HOME/.config/dunst/dunstrc.d/colors.conf" <<EOF
[global]
frame_color = "#${BASE0B}"

[urgency_low]
background = "#${BASE00}"
foreground = "#${BASE05}"
frame_color = "#${BASE0B}"

[urgency_normal]
background = "#${BASE00}"
foreground = "#${BASE05}"
frame_color = "#${BASE0B}"

[urgency_critical]
background = "#${BASE00}"
foreground = "#${BASE05}"
frame_color = "#${BASE08}"
EOF

# Neovim
cat > "$CURRENT_DIR/nvim.lua" <<EOF
vim.o.background = "${NVIM_BACKGROUND}"
vim.cmd.colorscheme("${NVIM_THEME}")
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
EOF

# Wallpaper — user override takes precedence over palette default
ACTIVE_WALLPAPER="$THEME_DIR/active-wallpaper"
if [ -f "$ACTIVE_WALLPAPER" ]; then
  WALL=$(cat "$ACTIVE_WALLPAPER")
else
  WALL="${WALLPAPER:-}"
fi

if [ -n "$WALL" ] && [ -f "$WALL" ]; then
  ln -sf "$WALL" "$CURRENT_DIR/wallpaper"
  hyprctl hyprpaper wallpaper ",$WALL" 2>/dev/null || true
fi

# --- Reload running apps ---

# Hyprland
hyprctl reload 2>/dev/null || true

# Waybar
pkill -SIGUSR2 waybar 2>/dev/null || true

# Dunst (kill it; it respawns on next notification)
pkill dunst 2>/dev/null || true

# Kitty (if running)
pkill -SIGUSR1 kitty 2>/dev/null || true

# Cursor
if [ -n "${CURSOR_THEME:-}" ]; then
  hyprctl setcursor "$CURSOR_THEME" "${CURSOR_SIZE:-32}" 2>/dev/null || true
  gsettings set org.gnome.desktop.interface cursor-theme "$CURSOR_THEME" 2>/dev/null || true
  gsettings set org.gnome.desktop.interface cursor-size "${CURSOR_SIZE:-32}" 2>/dev/null || true
fi

# GTK color scheme (dark/light)
gsettings set org.gnome.desktop.interface color-scheme "${GTK_COLOR_SCHEME:-prefer-dark}" 2>/dev/null || true

# Ghostty: send config reload request
pkill -USR1 ghostty 2>/dev/null || true

# Neovim: send :luafile to all running instances via RPC
for sock in /tmp/nvim-*.sock; do
  [ -S "$sock" ] && nvim --server "$sock" --remote-send "<Cmd>luafile ~/.config/theme/current/nvim.lua<CR>" 2>/dev/null || true
done

# Obsidian                                                                                                                                                                                                  
OBSIDIAN_VAULT="$HOME/Documents/absentia-vault"                                                                                                                                                             
OBSIDIAN_SNIPPETS="$OBSIDIAN_VAULT/.obsidian/snippets"                                                                                                                                                      
                                                                                                                                                                                                            
mkdir -p "$OBSIDIAN_SNIPPETS"
cat > "$OBSIDIAN_SNIPPETS/theme-colors.css" <<EOF
.theme-dark {                                                                                                                                                                                               
  --background-primary: #${BASE00};                                                                                                                                                                         
  --background-secondary: #${BASE01};
  --background-modifier-border: #${BASE02};                                                                                                                                                                 
  --background-modifier-hover: #${BASE01}; 
  --background-modifier-active-hover: #${BASE02};                                                                                                                                                           
                                                                                                                                                                                                            
  --text-normal: #${BASE05};                                                                                                                                                                                
  --text-muted: #${BASE04};                                                                                                                                                                                 
  --text-faint: #${BASE03};                                                                                                                                                                                 
  --text-accent: #${BASE0D};                                                                                                                                                                                
  --text-accent-hover: #${BASE0C};                                                                                                                                                                          
                                                                                                                                                                                                            
  --interactive-normal: #${BASE01};                                                                                                                                                                         
  --interactive-hover: #${BASE02};                                                                                                                                                                          
  --interactive-accent: #${BASE0D};                                                                                                                                                                         
  --interactive-accent-hover: #${BASE0C};                                                                                                                                                                   
                                                                                                                                                                                                            
  --color-red: #${BASE08};                                                                                                                                                                                  
  --color-orange: #${BASE09};                                                                                                                                                                               
  --color-yellow: #${BASE0A};                                                                                                                                                                               
  --color-green: #${BASE0B};                                                                                                                                                                                
  --color-cyan: #${BASE0C};                                                                                                                                                                                 
  --color-blue: #${BASE0D};                                                                                                                                                                                 
  --color-purple: #${BASE0E};                                                                                                                                                                               
  --color-pink: #${BASE0F};                                                                                                                                                                                 
                                                                                                                                                                                                            
  --titlebar-background: #${BASE00};                                                                                                                                                                        
  --titlebar-background-focused: #${BASE00};                                                                                                                                                                
                                                                                                                                                                                                            
  --highlight-mix-blend-mode: lighten;                                                                                                                                                                      
  --text-highlight-bg: rgba($(printf '%d,%d,%d' 0x${BASE0A:0:2} 0x${BASE0A:2:2} 0x${BASE0A:4:2}),0.3);
EOF
pgrep -f obsidian >/dev/null 2>&1 && obsidian reload 2>/dev/null || true                                                                                                                                  

# Firefox (Pywalfox)                                                                                                                                                                                        
pywalfox update 2>/dev/null || true

notify-send -a "Theme Switcher" "Theme: $THEME" "Successfully applied" 2>/dev/null || true
