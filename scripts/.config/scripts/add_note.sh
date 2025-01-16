#!/bin/bash

standard_note(){
    file_name=$(echo "$STANDARD_FILE" | tr ' ' '-')
    formatted_file_name=$(date "+%Y-%m-%d")_${file_name}.md
    cd ${OBSIDIAN_PATH} || exit
    touch "${OBSIDIAN_PATH}/09 - Temp/Draft/${formatted_file_name}"
    nvim "${OBSIDIAN_PATH}/09 - Temp/Draft/${formatted_file_name}"
}

daily_note(){
    file_name=$(date "+%Y-%m-%d").md
    cd ${OBSIDIAN_PATH} || exit
    touch "${OBSIDIAN_PATH}/04 - Daily/${file_name}"
    nvim "${OBSIDIAN_PATH}/04 - Daily/${file_name}"
}

STANDARD_FILE=$1

if [ -z "$1" ]; then
    daily_note
else
    standard_note
fi
