#!/bin/sh

# Date 
date=$(date +'%d-%m %I:%M')

# Battery Capacity
bat=$(cat /sys/class/power_supply/BAT0/capacity)

# Battery Status
batStat=$(cat /sys/class/power_supply/BAT0/status)

if [ "$batStat" = "Charging" ] || [ "$batStat" = "Full" ]; then
    bat_color="<span foreground='#789978'></span>"
elif [ "$bat" -le 20 ]; then
    bat_color="<span foreground='#d70000'></span>"
else
    bat_color="<span foreground='#7788aa'></span>"
fi

# Linux Version
linuxVersion=$(uname -r | cut -d '-' -f1)

# Volume
masterVolume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}' | sed 's/^0\.//')

# Brightness
brightness=$(light -G)

# Wifi
wifi=$(nmcli -t -f ACTIVE dev wifi | grep -q "^yes" && echo -e "<span foreground='#7788AA'></span> " || echo "<span foreground='#d70000'></span> ")

echo $wifi " " $bat_color "" $bat"%" "  " $masterVolume"%" "  " $brightness"%" "  " $date
