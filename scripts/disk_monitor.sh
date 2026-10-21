#!/bin/bash

threshold=80
usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d "%")

echo "=== DISK MONITOR ==="
echo "Disk usage: $usage%"
echo "Threshold: $threshold%"

if [ "$usage" -ge "$threshold" ]; then
    echo "Status: WARNING"
else
    echo "Status: OK"
fi

