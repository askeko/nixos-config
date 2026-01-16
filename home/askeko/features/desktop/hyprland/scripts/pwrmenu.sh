#!/bin/sh

case "$(printf "󰌾  Lock\n󰗽  Logout\n󰜉  Reboot\n󰐥  Shutdown" | rofi -dmenu 'Action: ')" in
'󰌾  Lock') hyprlock ;;
'󰗽  Logout') hyprctl dispatch exit ;;
'󰜉  Reboot') systemctl reboot -i ;;
'󰐥  Shutdown') systemctl poweroff -i ;;
*) exit 1 ;;
esac

