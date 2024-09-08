#!/bin/bash
# This script will verify that videos play properly by jumping to a few seconds before the video ends

# Directory containing the videos
VIDEO_DIR="/home/alexj/Downloads/Java"

# Video file extensions to check
VIDEO_EXTENSIONS=("mp4" "mkv" "avi" "mov" "flv" "wmv")

# Define how many seconds before the end to start playing
SECONDS_BEFORE_END=2

# Function to check videos in a given directory
check_videos() {
    local dir="$1"

    # Loop through each file in the directory
    for file in "$dir"/*; do
        # If it's a directory, recursively check its contents
        if [ -d "$file" ]; then
            check_videos "$file"
        else
            # Get the file extension
            extension="${file##*.}"

            # Check if the file is a video by matching its extension
            if [[ " ${VIDEO_EXTENSIONS[@]} " =~ " ${extension,,} " ]]; then
                echo "Checking $file..."

                # Get the total duration of the video in seconds
                duration=$(cvlc --intf dummy --play-and-exit --run-time=1 --video-title-show "$file" vlc://quit 2>/dev/null | grep -oP 'Duration: \K[0-9]+(?=\smin)')

                # Calculate the start time to jump to
                start_time=$((duration * 60 - SECONDS_BEFORE_END))

                # Play the video starting from the calculated time
                cvlc --intf dummy --start-time=$start_time --play-and-exit "$file" vlc://quit > /dev/null 2>&1

                # Check the exit status of vlc to determine if the video played successfully
                if [ $? -ne 0 ]; then
                    echo "Error: $file might be corrupted or cannot be played."
                else
                    echo "$file is OK."
                fi
            fi
        fi
    done
}

# Start checking from the main directory
check_videos "$VIDEO_DIR"

