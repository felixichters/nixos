show_menu() {
    echo -e "$1" | fuzzel --dmenu --prompt "$2"
}

# Select action
action=$(show_menu "Power Off\nReboot" "Select action:")

if [ -z "$action" ]; then
    exit 0
fi

# Confirm action
confirmation=$(show_menu "No\nYes" "Are you sure you want to $action?")

if [ "$confirmation" == "Yes" ]; then
    if [ "$action" == "Power Off" ]; then
        systemctl poweroff
    elif [ "$action" == "Reboot" ]; then
        systemctl reboot
    fi
fi