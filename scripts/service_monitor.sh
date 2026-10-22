#!/bin/bash

echo "=== SERVICE MONITOR ==="

if [ -z "$1" ]; then
    echo "Error: Missing service name."
    exit 1
fi

echo "Service: $1"

load_state=$(systemctl show "$1" -p LoadState --value)
if [ "$load_state" = "not-found" ]; then
    echo "Error: Service does not exist."
    exit 1
fi

status=$(systemctl is-active "$1")
echo "Status: $status"

if [ "$status" = "active" ]; then
    echo "Service is running."
elif [ "$status" = "inactive" ]; then
    echo "Service is stopped."
else
    echo "Service is not running or status is unknown."
fi

startup=$(systemctl is-enabled "$1")
echo "Startup: $startup"
