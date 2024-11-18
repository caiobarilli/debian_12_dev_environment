#!/bin/bash

# Logs
logs_folder="./logs/"
if [ ! -d "$logs_folder" ]; then
    mkdir -p "$logs_folder"
fi

log_file="./logs/debian_12_dev_enviroment.log"
> "$log_file"

log() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" >> "$log_file"
}
