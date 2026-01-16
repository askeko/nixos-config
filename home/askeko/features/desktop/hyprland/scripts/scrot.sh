#!/usr/bin/env bash

prompt='Screenshot'
mesg="DIR: ~/Pictures"

option_1="󰍹 Take Screenshot"
option_2="󱂬 Capture Focused Window"
option_3="󱣵 Capture Area"

copy=' Copy'
save=' Save'

# Notification click handler (Taken from https://github.com/vlevit/notify-send.sh)
function monitor() {
    local notification_id=$1
    local filename=$2
    local delete_tmp=$3

    if [ "$filename" == "" ] || [ "$notification_id" == "" ]; then
        exit 0
    fi

    local gdbus_monitor_pid=/tmp/screenshot-action-dbus-monitor.$$.pid
    local gdbus_monitor=(gdbus monitor --session --dest org.freedesktop.Notifications --object-path /org/freedesktop/Notifications)
    rm -f "$gdbus_monitor_pid"
    umask 077
    touch "$gdbus_monitor_pid"
    (
        "${gdbus_monitor[@]}" &
        echo $! >&3
    ) 3>"$gdbus_monitor_pid" | while read -r line; do
        local closed_notification_id="$(sed '/^\/org\/freedesktop\/Notifications: org.freedesktop.Notifications.NotificationClosed (uint32 \([0-9]\+\), uint32 [0-9]\+)$/!d;s//\1/' <<<"$line")"
        if [[ -n "$closed_notification_id" ]]; then
            if [[ "$closed_notification_id" == "$notification_id" ]]; then
                if [ $delete_tmp == 1 ]; then
                    rm -rf "$filename"
                fi
                break
            fi
        else
            local action_invoked="$(sed '/\/org\/freedesktop\/Notifications: org.freedesktop.Notifications.ActionInvoked (uint32 \([0-9]\+\), '\''\(.*\)'\'')$/!d;s//\1:\2/' <<<"$line")"
            IFS=: read invoked_id action_id <<<"$action_invoked"
            if [[ "$invoked_id" == "$notification_id" ]]; then
                xdg-open "$filename"
                break
            fi
        fi
    done
    kill $(<"$gdbus_monitor_pid")
    rm -rf "$gdbus_monitor_pid"
}

function send_notification() {
    local title=$1
    local body=$2
    local filename=$3

    local notification_id=$(gdbus call --session \
        --dest org.freedesktop.Notifications \
        --object-path /org/freedesktop/Notifications \
        --method org.freedesktop.Notifications.Notify \
        -- \
        "Screenshot" 0 "$filename" "$title" "$body" \
        "['default', '']" {} "int32 -1" | sed 's/(uint32 \([0-9]\+\),)/\1/g')

    monitor $notification_id "$filename" $4 &
}

function notify() {
    if ! command -v gdbus &>/dev/null; then
        return
    fi
    if [ "$1" == "" ] || [ "$2" == "$copy" ]; then
        return
    fi

    local detail="Saved at $1"
    if [ "$2" == "$copy" ]; then
        detail="Stored in clipboard"
    fi

    send_notification "Screenshot taken" "$detail" "$1" "$2"
}

function take_screenshot() {
    local screenshot_type=$1
    local copy_to_clipboard=$2
    local filename=""
    local cmd="grim"
    local geo=""

    if [ "$copy_to_clipboard" == "" ]; then
        return
    elif [ "$screenshot_type" == "$option_2" ]; then
        cmd="grim -g"
        geo=$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')
    elif [ "$screenshot_type" == "$option_3" ]; then
        cmd="grim -g"
        geo=$(slurp)
    fi

    if [ "$copy_to_clipboard" == "$copy" ]; then
        filename=$(mktemp /tmp/screenshot.XXXXXX.png)
    else
        filename=$(xdg-user-dir PICTURES)/Screenshots/$(date +'Screenshot_%Y-%m-%d_%H%M%S.png')
    fi

    if [ "$geo" == "" ]; then
        $cmd - | swappy -o "$filename" -f -
    else
        $cmd "$geo" - | swappy -o "$filename" -f -
    fi

    if [ "$copy_to_clipboard" == "$copy" ]; then
        wl-copy <"$filename"
    fi

    notify "$filename" "$copy_to_clipboard"
}

# Rofi CMD
function rofi_cmd() {
    rofi -theme-str "window {width: 350px;}" \
        -theme-str "listview {columns: 1; lines: 3;}" \
        -theme-str 'textbox-prompt-colon {str: "";}' \
        -dmenu \
        -p "$prompt" \
        -mesg "$mesg" \
        -markup-rows
}

function save_copy() {
    rofi -theme-str 'window {width: 500px;}' \
        -theme-str 'mainbox {orientation: vertical; children: [ "message", "listview" ];}' \
        -theme-str 'listview {columns: 1; lines: 3;}' \
        -dmenu \
        -p 'Choose Option' \
        -mesg 'Copy/save the screenshot:' \
        -markup-rows
}

# Execute Command
function run_cmd() {
    if [[ "$1" == '--opt1' ]]; then
        copy_save="$(copy_save)"
        take_screenshot "$option_1" "$copy_save"
    elif [[ "$1" == '--opt2' ]]; then
        copy_save="$(copy_save)"
        take_screenshot "$option_2" "$copy_save"
    elif [[ "$1" == '--opt3' ]]; then
        copy_save="$(copy_save)"
        take_screenshot "$option_3" "$copy_save"
    fi
}

copy_save_cmd() {
    rofi -theme-str 'window {width: 300px;}' \
        -theme-str 'mainbox {orientation: vertical; children: [ "message", "listview" ];}' \
        -theme-str 'listview {columns: 1; lines: 2;}' \
        -dmenu \
        -p 'Choose Option' \
        -mesg 'Copy/save the screenshot'
}

function copy_save() {
    echo -e "$copy\n$save" | copy_save_cmd
}

function run_rofi() {
    echo -e "$option_1\n$option_2\n$option_3" | rofi_cmd
}

chosen="$(run_rofi)"
case ${chosen} in
$option_1)
    run_cmd --opt1
    ;;
$option_2)
    run_cmd --opt2
    ;;
$option_3)
    run_cmd --opt3
    ;;
esac

