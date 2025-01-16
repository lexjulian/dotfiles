#!/bin/bash

# This script will notify the date and time. You can bind this to a key available for you.
date_time=$(date +"%A, %B %d, %Y %I:%M %p")

dunstify "$date_time" -u normal
