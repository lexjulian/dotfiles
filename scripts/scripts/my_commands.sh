#!/bin/bash

# Define colors
BOLD='\033[1m'
UNDERLINE='\033[4m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Set the column widths
command_width=60
description_width=70
padding_width=$((command_width + 1)) # Adjust for the space between columns

# Calculate total width of the table
total_width=$((command_width + description_width + 5)) # Adding 5 for spaces and borders

# Function to wrap text and align with the description column
wrap_text() {
    local text="$1"
    local width="$2"
    local padding=$(printf "%-${padding_width}s" "")
    echo "$text" | fold -s -w "$width" | sed "2,\$s/^/$padding/"
}

# Function to print with padding and text wrapping
print_row() {
    local command="$1"
    local description="$2"
    printf "${GREEN}%-${command_width}s${NC}" "$command"
    echo -e "${YELLOW}$(wrap_text "$description" "$description_width")${NC}"
}
echo -e "\n"
echo -e "${BLUE}$(printf '%*s' "$total_width" | tr ' ' '-')${NC}"
# Print the table header
printf "${BOLD}${CYAN}%-${command_width}s${NC} ${BOLD}${CYAN}%-${description_width}s${NC}\n" "IN CASE YOU FORGOT" "DESCRIPTION"

# Print a separator line matching terminal width
echo -e "${BLUE}$(printf '%*s' "$total_width" | tr ' ' '-')${NC}"

# Print the table rows
print_row "archlinux-java help" "Shows the options for Java."
print_row "chmod +x 'text.sh'" "Make the script executable for creating your own bash scripts."
print_row "git add -u" "Delete all deleted files in git."
print_row "grep -n 'text' 'file'" "Find all the text inside the file and shows the line number."
print_row "grep -v 'text' 'file'" "Removes all the lines matched with the word and only shows the lines without the word."
print_row "nmcli device wifi list" "Shows all the list of wifi connection."
print_row "nmcli device wifi rescan" "Try to rescan just in case the wifi is not showing."
print_row "nmcli device wifi connect 'SSID' password 'SSIDPASSWORD'" "Insert the necessary information and connect to the desired wifi connection."
print_row "nmcli connection show" "Verify the connection."
print_row "ps aux | grep 'text'" "Checks all the running programs pipe with grep. ${RED}Note:${NC} You can get the PID in the first set of numbers and ${RED}kill it${NC}."
print_row "nmcli radio wifi off/on" "Toggle wifi on/off."
print_row "systemctl list-units --type=service --state=running" "Shows all the active systemd."
print_row "xrandr -q" "Shows all info about monitors."
print_row "xrandr --output HDMI-1 --same-as eDP-1" "Will duplicate your main monitor to your second monitor. ${RED}Note:${NC} If you are using Polybar, the statusbar will be on top of each other. Comment the for loop in .config/polybar/launch_polybar.sh."

# Print a separator line at the end
echo -e "${BLUE}$(printf '%*s' "$total_width" | tr ' ' '-')${NC}"

