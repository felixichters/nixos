show_menu() {
    echo -e "$1" | fuzzel --dmenu --prompt "$2" -a top-left -C 00000000 -r 0 -w 11 -l 3
}

# Select action
action=$(show_menu "Power Off\nReboot" "Select action:")

if [ -z "$action" ]; then
    exit 0
fi

# Confirm action
confirmation=$(show_menu "No\nYes" "Are you sure you want to $action?")

if [ "$action" == "Power Off" ]; then
    systemctl poweroff
elif [ "$action" == "Reboot" ]; then
    systemctl reboot
fi