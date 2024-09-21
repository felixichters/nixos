show_menu() {
    echo -e "$1" | fuzzel --dmenu --prompt "$2"  -r 0 -B 0 -a center -w 10 -l 2
}

# Select action
action=$(show_menu "Power Off\nReboot")

if [ -z "$action" ]; then
    exit 0
fi

if [ "$action" == "Power Off" ]; then
    systemctl poweroff
elif [ "$action" == "Reboot" ]; then
    systemctl reboot
fi
