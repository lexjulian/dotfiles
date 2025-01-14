#!/bin/bash

# For laptops only
# This script will run dunst notification whenever your battery is down to 20% and more than 97%
# Paired with a cronjob that will run every 5 mins.
# You can also setup the cronjob to generate stderr and stdout in a logfile.log.
# Usage:
#       ```
#       */5 * * * * ~/.config/scripts/check_battery.sh >> ~/.config/scripts/logfile.log 2>&1
#       ```

# Define your battery preference
BATTERY_LOW=20
BATTERY_FULL=97
# Date and time for logs 
DATE_TIME=$(date +"%A, %B %d, %Y %I:%M %p")

# Check if the capacity file exists
if [ ! -f /sys/class/power_supply/BAT0/capacity ] && [ ! -f /sys/class/power_supply/BAT1/capacity ]; then
    echo "Battery capacity information not found. Please check your system configuration. - $DATE_TIME"
    exit 1
elif [ -f /sys/class/power_supply/BAT0/capacity ]; then 
    BATTERY_PERCENTAGE=$(cat /sys/class/power_supply/BAT0/capacity)
elif [ -f /sys/class/power_supply/BAT1/capacity ]; then
    BATTERY_PERCENTAGE=$(cat /sys/class/power_supply/BAT1/capacity)
fi

# Ensure the variable contains a valid number
if [[ -n "$BATTERY_PERCENTAGE" && "$BATTERY_PERCENTAGE" =~ ^[0-9]+$ ]]; then
    if [ "$BATTERY_PERCENTAGE" -lt $BATTERY_LOW ]; then
        env DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" /usr/bin/dunstify "Warning: Battery almost empty (${BATTERY_PERCENTAGE}%). Please charge your device." -u critical
        echo "Battery Almost Empty - $DATE_TIME"
    elif [ "$BATTERY_PERCENTAGE" -gt $BATTERY_FULL ]; then
        env DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" /usr/bin/dunstify "Battery almost charge (${BATTERY_PERCENTAGE}%)" -u normal -t 30000
        echo "Battery Full - $DATE_TIME"
    fi
else
    echo "Failed to retrieve battery percentage. Please check your system settings. - $DATE_TIME"
fi
