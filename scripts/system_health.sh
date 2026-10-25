#!/bin/bash
set -o pipefail

overall_status="OK"

check_cpu() {
    local cpu_idle
    local cpu_usage

    if ! cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}'); then
        echo "Error: CPU check failed."
        overall_status="WARNING"
        return 1
    fi
    if [ -z "$cpu_idle" ]; then
        echo "Error: Unable to read CPU idle."
        overall_status="WARNING"
        return 1
    fi
    if ! [[ "$cpu_idle" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        echo "Error: Invalid CPU idle value."
        overall_status="WARNING"
        return 1
    fi
    if awk -v value="$cpu_idle" 'BEGIN {exit !(value > 100)}'; then
        echo "Error: CPU idle value out of range."
        overall_status="WARNING"
        return 1
    fi
    if ! cpu_usage=$(awk -v idle="$cpu_idle" 'BEGIN {print 100 - idle}'); then
        echo "Error: CPU calculation failed."
        overall_status="WARNING"
        return 1
    fi
    if [ -z "$cpu_usage" ]; then
        echo "Error: Unable to calculate CPU usage."
        overall_status="WARNING"
        return 1
    fi
    if awk -v usage="$cpu_usage" 'BEGIN {exit !(usage >= 80)}'; then
        echo "CPU Usage: $cpu_usage% [WARNING]"
        overall_status="WARNING"
    else
        echo "CPU Usage: $cpu_usage% [OK]"
    fi 
}

check_ram() {
    local ram_usage

    if ! ram_usage=$(free -m | awk '/^Mem:/ {printf "%.1f\n", (( ($2 - $7) / $2 * 100 ))}'); then
        echo "Error: RAM check failed."
        overall_status="WARNING"
        return 1
    fi
    if [ -z "$ram_usage" ]; then
        echo "Error: Unable to read RAM usage"
        overall_status="WARNING"
        return 1
    fi
    if awk -v usage="$ram_usage" 'BEGIN {exit !(usage >= 80)}'; then
        echo "RAM Usage: $ram_usage% [WARNING]"
        overall_status="WARNING"
    else
        echo "RAM Usage: $ram_usage% [OK]"
    fi
}

check_disk() {
    local disk_usage

    if ! disk_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%'); then
        echo "Error: Command failed."
        overall_status="WARNING"
        return 1
    fi
    if [ -z "$disk_usage" ]; then
        echo "Error: Unable to read disk usage"
        overall_status="WARNING"
        return 1
    fi
    if [ "$disk_usage" -ge 80 ]; then
        echo "Disk Usage: $disk_usage% [WARNING]"
        overall_status="WARNING"
    else
        echo "Disk Usage: $disk_usage% [OK]"
    fi 
}

echo "=== SYSTEM HEALTH REPORT ==="
echo
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"
echo
check_cpu
check_ram
check_disk
echo
echo "Overall Status: $overall_status"