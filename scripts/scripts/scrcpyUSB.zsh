#!/bin/zsh
adb kill-server
adb start-server
adb devices
wait
scrcpy
wait
exit 0