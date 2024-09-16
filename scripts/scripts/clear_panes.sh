#!/bin/bash

for pane in $(tmux list-panes -F '#P'); do
  if [ "$pane" -eq 0 ]; then
    tmux select-pane -t $pane
    tmux send-keys 'clearf' C-m
  else
    tmux select-pane -t $pane
    tmux send-keys 'clear' C-m
  fi
done

