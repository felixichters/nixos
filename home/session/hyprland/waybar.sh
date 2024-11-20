is_waybar_running() {
    pgrep waybar > /dev/null
}

start_waybar() {
    waybar &
}

kill_waybar() {
    pkill waybar
}

if is_waybar_running; then
    echo "Waybar is running. Killing Waybar."
    kill_waybar
else
    echo "Waybar is not running. Starting Waybar."
    start_waybar
fi

