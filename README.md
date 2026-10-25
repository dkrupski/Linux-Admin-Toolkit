# Linux Admin Toolkit

A collection of Bash scripts for Linux system administration,
monitoring, automation, and basic security auditing.

Developed as a hands-on project to practice Bash scripting,
Linux administration, error handling, and command-line tools.

## Technologies

- Bash
- Linux
- Git


## Scripts

### 1. System Information (`system_info.sh`)
Displays basic Linux system information.
- Hostname and current user
- Kernel version and system uptime
- CPU information
- RAM and disk usage

### 2. Disk Monitor (`disk_monitor.sh`)
Monitors disk usage and displays a warning when usage reaches a defined threshold.

### 3. Backup Tool (`backup.sh`)
Creates compressed backups of directories.
- Accepts a source directory as an argument
- Creates timestamped `.tar.gz` archives
- Handles missing source directories and backup failures

### 4. Log Analyzer (`log_analyzer.sh`)
Analyzes log files and displays:
- Total number of lines
- Counts of INFO, WARNING, and ERROR messages
- Optional case-insensitive keyword search
- Error handling for missing or unreadable files

### 5. Process Monitor (`process_monitor.sh`)
Monitors running Linux processes.
- Displays the top 5 processes by CPU usage
- Displays the top 5 processes by memory usage
- Searches for processes by name
- Checks process details by PID
- Validates PID input and handles missing processes

### 6. Service Monitor (`service_monitor.sh`)
Monitors systemd services on Linux.
- Checks whether a service exists
- Displays the current service status
- Identifies running and stopped services
- Shows whether a service is enabled at startup

### 7. Network Monitor (`network_monitor.sh`)
Performs basic Linux network diagnostics.
- Checks host reachability using ping
- Checks whether a local TCP/UDP port is listening
- Validates port numbers (1–65535)
- Checks HTTP status codes using curl
- Handles connection errors

### 8. User Audit (`user_audit.sh`)
Audits Linux user accounts and home directory permissions.
- Checks whether a user exists
- Displays UID, GID, and group memberships
- Shows the user's home directory and login shell
- Checks home directory permissions
- Detects directories writable by group or others
- Handles missing users and home directories

### 9. System Health Monitor (`system_health.sh`)
Monitors overall Linux system health and generates a status report.
- Monitors CPU, RAM, and disk usage
- Displays system hostname and uptime
- Detects resource usage at or above an 80% threshold
- Provides an overall system status (OK/WARNING)
- Handles command failures and invalid CPU data

### 10. Admin Toolkit (`admin_toolkit.sh`)
Provides an interactive command-line interface for Linux system administration.
- Integrates all nine administration tools into one menu
- Supports user input and optional arguments
- Runs scripts independently of the current working directory
- Handles invalid menu selections and end-of-file (EOF) input
- Returns to the main menu after executing a tool

## Requirements

- Linux with systemd
- Bash
- Standard Linux command-line utilities
- `curl`, `ping`, and `ss`
- `top`, `free`, `df`, and `awk`

## Usage

Clone the repository:

```bash
git clone https://github.com/dkrupski/Linux-Admin-Toolkit.git
cd Linux-Admin-Toolkit
```

### Interactive Menu

Launch all administration tools from one menu:

```bash
bash scripts/admin_toolkit.sh
```

### Individual Scripts

You can also run each script separately.

```bash
# Display system information
bash scripts/system_info.sh

# Check disk usage
bash scripts/disk_monitor.sh

# Create a directory backup
bash scripts/backup.sh /path/to/directory

# Analyze a log file
bash scripts/log_analyzer.sh tests/system.log

# Search log entries by keyword
bash scripts/log_analyzer.sh tests/system.log Backup

# Display top CPU and memory processes
bash scripts/process_monitor.sh

# Search for a process by name
bash scripts/process_monitor.sh code

# Check a process by PID (replace 2109 with an existing PID)
bash scripts/process_monitor.sh "" 2109

# Check service status and startup configuration
bash scripts/service_monitor.sh ssh

# Check host availability
bash scripts/network_monitor.sh google.com

# Check host and local port
bash scripts/network_monitor.sh google.com 22

# Check host, local port and HTTP status
bash scripts/network_monitor.sh google.com 22 https://www.google.com

# Audit the current user
bash scripts/user_audit.sh "$(whoami)"

# Audit a specific user
bash scripts/user_audit.sh root

# Generate a system health report
bash scripts/system_health.sh
```

## Environment

Developed and tested on Kali Linux.

## Author

GitHub: [dkrupski](https://github.com/dkrupski)


