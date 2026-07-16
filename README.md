# Linux System Health Checker
## Overview
The Linux System Health Checker is a Bash script created inside of a Virtual Machine, running the Linux Desktop OS `Ubuntu`. The script `health_checker.sh` when executed, displays essential system information (Disk Usuage, Memory Usage, CPU Usage, Services Active, Hostname, and User). It creates a `logs` directory and a respective `logfile` within the directory that captures the system information and stores it in the user's directory with the date it was executed. 
## Features
- System Information
- System Performance
- Service Monitoring
- Report Generation
- Log Directory Generation
## Requirements
- Linux operating system (Ubuntu, Debian, Fedora, Arch, etc.)
- Bash shell (version 4.0 or later recommended)
- Standard Linux utilities:
- `hostname`
- `whoami`
- `date`
- `uname`
- `uptime`
- `df`
- `free`
- `systemctl`
- `tee`
- `mkdir`
- Permission to execute Bash scripts
## Installation
Clone the repository:

```bash
git clone https://github.com/Nur-Howell/linux-system-health-checker.git
cd Linux-System-Health-Checker
```

Make the script executable:

```bash
chmod +x health_checker.sh
```

Run the script:

```bash
health_checker.sh
```

> [!NOTE]
> This project uses `systemctl` to check system services. It is intended for Linux distributions that use **systemd**.
