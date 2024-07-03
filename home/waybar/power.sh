show_menu() {
    echo -e "$1" | fuzzel --dmenu --prompt "$2"  -r 10 -w 20 -l 2
}

# Select action
action=$(show_menu "Power Off\nReboot" "Select action:")

if [ -z "$action" ]; then
    exit 0
fi

if [ "$action" == "Power Off" ]; then
    systemctl poweroff
elif [ "$action" == "Reboot" ]; then
    systemctl reboot
fi