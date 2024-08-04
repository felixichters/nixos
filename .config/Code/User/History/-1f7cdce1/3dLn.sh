action=$(echo -e "Power Off\nReboot" | rofi -dmenu -i -p "Select action:")

if [ -z "$action" ]; then
    exit 0
fi

confirmation=$(echo -e "No\nYes" | rofi -dmenu -i -p "Are you sure you want to $action?")

if [ "$confirmation" == "Yes" ]; then
    if [ "$action" == "Power Off" ]; then
        systemctl poweroff
    elif [ "$action" == "Reboot" ]; then
        systemctl reboot
    fi
fi
