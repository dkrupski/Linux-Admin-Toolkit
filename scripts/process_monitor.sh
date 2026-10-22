#!/bin/bash

echo "=== PROCESS MONITOR ==="
echo
echo "=== TOP 5 CPU PROCESSES ==="
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo
echo "=== TOP 5 MEMORY PROCESSES ==="
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6
echo
if [ -n "$1" ]; then
    echo "=== PROCESS SEARCH ==="
    if ! pgrep -a "$1"; then
        echo "No matching processes found."
    fi
fi
echo
if [ -n "$2" ]; then
    echo "=== PID SEARCH ==="
    if [[ ! "$2" =~ ^[0-9]+$ ]]; then
        echo "Error: PID must be a number"
    else
        if ! ps -p "$2" -o pid,comm,%cpu,%mem; then
            echo "Process not found."
        fi
    fi
fi