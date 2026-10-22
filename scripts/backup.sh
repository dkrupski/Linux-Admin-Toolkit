#!/bin/bash

echo "=== BACKUP TOOL ==="

if [ $# -eq 0 ]; then
    echo "Error: Missing source directory"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: Directory does not exist"
    exit 1 
fi

echo "Source: $1"


timestamp=$(date +"%Y%m%d_%H%M%S")
folder_name=$(basename "$1")
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
backup_dir="$script_dir/../backups"
if ! mkdir -p "$backup_dir"; then
    echo "Error: Cannot create backup directory."
    exit 1
fi
backup_file="${backup_dir}/${folder_name}_${timestamp}.tar.gz"


echo "Creating backup..."
if tar -czf "$backup_file" -C "$(dirname "$1")" "$(basename "$1")"; then
    echo "Backup created: $backup_file"
    echo "Status: SUCCESS"
else
    echo "Status: ERROR"
    exit 1
fi
