#!/usr/bin/env bash

dir="$HOME/.config/rofi/powermenu/"
theme='style'

uptime="$(uptime -p | sed -e 's/up //g')"
host=$(hostname)

shutdown=''
reboot=''
lock=' '
suspend=''
logout=''
yes='Yes'
no='No'

rofi_cmd() {
    rofi -dmenu \
        -p "$host" \
        -mesg "Uptime: $uptime" \
        -theme "${dir}/${theme}.rasi"
}

confirm_cmd() {
    rofi \
        -theme-str 'window {location: center; anchor: center; width: 250px;}' \
        -theme-str 'mainbox {children: ["message", "listview"];}' \
        -theme-str 'listview {columns: 2; lines: 1;}' \
        -theme-str 'element-text {horizontal-align: 0.5;}' \
        -theme-str 'textbox {horizontal-align: 1;}' \
        -dmenu \
        -p 'Confirm' \
        -mesg 'Are you sure?' \
        -theme "${dir}/${theme}.rasi"
}

confirm_exit() {
    echo -e "$yes\n$no" | confirm_cmd
}

run_rofi() {
    echo -e "$shutdown\n$lock\n$logout\n$reboot\n$suspend" | rofi_cmd
}

run_cmd() {
    selected="$(confirm_exit)"
    if [[ "$selected" == "$yes" ]]; then
        case $1 in
            --shutdown) systemctl poweroff ;;
            --reboot)   systemctl reboot ;;
            --suspend)
                playerctl --player=spotify,brave,%any pause
                systemctl suspend
                ;;
            --logout)   swaymsg exit ;;
        esac
    fi
}

chosen="$(run_rofi)"
case ${chosen} in
    $shutdown) run_cmd --shutdown ;;
    $reboot)   run_cmd --reboot ;;
    $lock)     swaylock ;;
    $suspend)  run_cmd --suspend ;;
    $logout)   run_cmd --logout ;;
esac
