
# Define the options
options="Power Off\nReboot"

# Display the options in rofi custom mode and capture the selected option
selected_option=$(echo -e "$options" | rofi -dmenu -p "Power Menu" -lines 2 -width 1 -padding 20 -location 2 -yoffset 30 -show drun)

case $selected_option in
    "Power Off")
        if echo -n "Are you sure you want to power off? (y/N): "; read -r response; [[ "$response" =~ ^[yY](es)?$ ]]; then
            systemctl poweroff
        fi
        ;;
    "Reboot")
        if echo -n "Are you sure you want to reboot? (y/N): "; read -r response; [[ "$response" =~ ^[yY](es)?$ ]]; then
            systemctl reboot
        fi
        ;;
    *)
        echo "Invalid option"
        ;;
esac
