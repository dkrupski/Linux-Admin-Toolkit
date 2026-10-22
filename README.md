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
- Error messages for missing or invalid files


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
```
