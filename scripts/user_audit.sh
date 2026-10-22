#!/bin/bash

echo "=== USER AUDIT ==="

if [ -z "$1" ]; then
    echo "Error: Missing username."
    exit 1
fi 

if  id "$1" > /dev/null 2>&1; then
    echo "User: $1"
    echo "UID: $(id -u "$1")"
    echo "GID: $(id -g "$1")"
    echo "Groups: $(id -Gn "$1")"
    echo "Home: $(getent passwd "$1" | cut -d ":" -f 6)"
    echo "Shell: $(getent passwd "$1" | cut -d ":" -f 7)"
else
    echo "Error: User does not exist."
    exit 1
fi 

home_dir=$(getent passwd "$1" | cut -d ":" -f 6)
if [ -d  "$home_dir" ]; then
    permissions=$(stat -c '%a' "$home_dir")
    echo "Home permissions: $permissions"
    if (( (8#$permissions & 2) != 0 )); then    
        echo "Warning: Home directory is writable by others."
    
    fi 
    if (( (8#$permissions & 16) != 0 )); then    
        echo "Warning: Home directory is writable by group."
    
    fi 
else
    echo "Warning: Home directory does not exist."
fi 


