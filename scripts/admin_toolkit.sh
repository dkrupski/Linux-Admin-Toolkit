#!/bin/bash

show_menu() {
    echo "
    ========== LINUX ADMIN TOOLKIT ==========

    1. System Information
    2. Disk Monitor
    3. Backup Tool
    4. Log Analyzer
    5. Process Monitor
    6. Service Monitor
    7. Network Monitor
    8. User Audit
    9. System Health Report
    0. Exit

    =========================================
    "
    }

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

while true; do
    show_menu
    if ! read -rp "Select an option: " choice; then
        echo "Input closed. Exiting..."
        break
    fi
    case "$choice" in 
        1) bash "$SCRIPT_DIR/system_info.sh" ;;
        2) bash "$SCRIPT_DIR/disk_monitor.sh" ;;
        3) read -rp "Enter directory to backup: " backup_dir
           bash "$SCRIPT_DIR/backup.sh" "$backup_dir" ;;
        4) read -rp "Enter log file path: " log_file
           read -rp "Enter keyword (optional): " keyword
           bash "$SCRIPT_DIR/log_analyzer.sh" "$log_file" "$keyword" ;;
        5) read -rp "Enter process name (optional): " process_name
           read -rp "Enter PID (optional): " process_pid
           bash "$SCRIPT_DIR/process_monitor.sh" "$process_name" "$process_pid" ;;
        6) read -rp "Enter service name: " service_name
           bash "$SCRIPT_DIR/service_monitor.sh" "$service_name" ;;
        7) read -rp "Enter host: " host
           read -rp "Enter local port (optional): " port
           read -rp "Enter URL (optional): " url
           bash "$SCRIPT_DIR/network_monitor.sh" "$host" "$port" "$url" ;;
        8) read -rp "Enter username: " username
           bash "$SCRIPT_DIR/user_audit.sh" "$username" ;;
        9) bash "$SCRIPT_DIR/system_health.sh" ;;
        0) echo "Exiting..." 
           break ;;
        *) echo "Invalid option" ;;
    esac
done