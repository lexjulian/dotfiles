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
command_width=70
description_width=60
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
printf "${BOLD}${CYAN}%-${command_width}s${NC} ${BOLD}${CYAN}%-${description_width}s${NC}\n" "VITE SETUP" "DESCRIPTION"

# Print a separator line matching terminal width
echo -e "${BLUE}$(printf '%*s' "$total_width" | tr ' ' '-')${NC}"

# Print the table rows
print_row "npm create vite@latest" "Install Vite at the latest version but use @4 for 2024"
print_row "npm i eslint vite-plugin-eslint eslint-config-react-app --save-dev" "Install eslint package in vite"
print_row "create a new file in project directory named '.eslintrc.json'" "{'extends' : 'react-app'}"
print_row "go to vite.config.js" "import eslint from 'vite-plugin-eslint', add in plugins: [eslint()]"
print_row "npm i react-router-dom" "Install the router, you can use @6 for 2024"
# Print a separator line at the end
echo -e "${BLUE}$(printf '%*s' "$total_width" | tr ' ' '-')${NC}"

