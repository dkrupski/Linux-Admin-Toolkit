# Linux Admin Toolkit

A collection of Bash scripts for Linux system administration,
process monitoring, file management, and automation.

## Technologies

- Bash
- Linux
- Git


## Scripts

### 1. System Information (`system_info.sh`)
Displays basic Linux system information:
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
- Handles missing directories and backup errors

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
Monitors Linux systemd services.
- Checks whether a service exists.
- Displays the current service status.
- Identifies running and stopped services.
- Shows whether a service is enabled at startup.

### 7. Network Monitor (`network_monitor.sh`)
Performs basic Linux network diagnostics.
- Checks host reachability using ping.
- Checks whether a local TCP/UDP port is listening.
- Validates port numbers (1–65535).
- Checks HTTP response status using curl.
- Handles connection errors.

## Usage

Clone the repository:

```bash
git clone https://github.com/dkrupski/Linux-Admin-Toolkit.git
cd Linux-Admin-Toolkit
```

Run the scripts:

```bash
# Display system information
./scripts/system_info.sh

# Check disk usage
./scripts/disk_monitor.sh

# Create a directory backup
./scripts/backup.sh /path/to/directory

# Analyze a log file
./scripts/log_analyzer.sh tests/system.log

# Search log entries by keyword
./scripts/log_analyzer.sh tests/system.log Backup

# Display top CPU and memory processes
./scripts/process_monitor.sh

# Search for a process by name
./scripts/process_monitor.sh code

# Search for a process by PID
./scripts/process_monitor.sh "" 2109

# Check service status and startup configuration
./scripts/service_monitor.sh ssh

# Check host availability
bash scripts/network_monitor.sh google.com

# Check host and local port
bash scripts/network_monitor.sh google.com 22

# Check host, local port and HTTP status
bash scripts/network_monitor.sh google.com 22 https://www.google.com
```
## Environment

Developed and tested on Kali Linux.

## Author

GitHub: [dkrupski](https://github.com/dkrupski)


