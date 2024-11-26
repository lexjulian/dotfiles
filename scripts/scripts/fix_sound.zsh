#!/bin/zsh

# Define the card and desired profile
CARD_NAME=$(pactl list cards short | awk '{print $2}')  # Gets the first card name
PROFILE="HiFi (HDMI1, HDMI2, HDMI3, Mic1, Mic2, Speaker)"  # Replace this with your desired profile

# Set the correct profile
pactl set-card-profile "$CARD_NAME" "$PROFILE"

# Wait briefly to ensure the profile is applied
sleep 2

# Verify if the profile is active
ACTIVE_PROFILE=$(pactl list cards | grep "Active Profile" | awk -F ': ' '{print $2}')
if [[ "$ACTIVE_PROFILE" != "$PROFILE" ]]; then
  echo "Failed to apply profile: $PROFILE"
  exit 1
fi

# Get the default sink and source after applying the profile
DEFAULT_SINK=$(pactl list sinks short | grep "HiFi__Speaker" | awk '{print $2}')
DEFAULT_SOURCE=$(pactl list sources short | grep "HiFi__Speaker" | awk '{print $2}')

# Check if sinks and sources exist
if [[ -z "$DEFAULT_SINK" || -z "$DEFAULT_SOURCE" ]]; then
  echo "No valid sink or source found for profile: $PROFILE"
  exit 1
fi

# Set the default sink (output device)
pactl set-default-sink "$DEFAULT_SINK"

# Set the default source (input device, e.g., microphone)
pactl set-default-source "$DEFAULT_SOURCE"

# Adjust the volume for the sink
pactl set-sink-volume "$DEFAULT_SINK" 50%

# Unmute if muted
pactl set-sink-mute "$DEFAULT_SINK" 0
pactl set-source-mute "$DEFAULT_SOURCE" 0

echo "Audio settings configured successfully."
