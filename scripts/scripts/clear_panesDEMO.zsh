#!/bin/zsh

# Define the directory for the rec command, if needed
DIR_TO_MONITOR="~/repos/bitedash"  # Change this to your desired directory

for pane in $(tmux list-panes -F '#P'); do
  if [ "$pane" -eq 0 ]; then
    tmux select-pane -t $pane
    tmux send-keys 'cf' C-m
  elif [ "$pane" -eq 2 ]; then
    tmux select-pane -t $pane
    tmux send-keys "rec $DIR_TO_MONITOR" C-m  # Insert the rec command in the second pane
  else
    tmux select-pane -t $pane
    tmux send-keys 'clear' C-m
  fi
done

tmux select-pane -t 1

