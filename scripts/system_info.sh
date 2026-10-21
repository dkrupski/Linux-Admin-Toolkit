#!/bin/bash


echo "=== SYSTEM INFORMATION ==="
echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "CPU: $(lscpu | grep 'Model name:' | awk -F: '{print $2}' | xargs)"
echo "RAM: $(free -h | awk '/^Mem:/ {print $3, "/", $2}')"
echo "Disk (/): $(df -h / | awk 'NR==2 {print $3, "/", $2, "(" $5 ")"}')"