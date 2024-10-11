#!/bin/zsh

# Change directory to Downloads
cd ~/Downloads

# Check if a link was provided
if [ -z "$1" ]; then
    echo "Download: $0 <Youtube-Link>"
    exit 1
fi

# Download the video using yt-dlp with the specified format
yt-dlp -f "bv+ba/b" "$1"

