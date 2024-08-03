## System Monitoring Dashboard
This script provides a simple system monitoring dashboard for displaying real-time metrics such as CPU usage, memory usage, disk usage, network activity, and system uptime. It also includes an alert mechanism for high CPU usage.

## Features
CPU Usage: Displays the percentage of CPU used.                                                                                                                                                                      
Memory Usage: Shows the percentage of memory used.                                                                                                                                                                   
Disk Usage: Indicates the percentage of disk space used.                                                                                                                                                             
Network Activity: Displays the amount of data received and transmitted.                                                                                                                                              
System Uptime: Shows the duration for which the system has been running.                                                                                                                                             
Alerts: Triggers an alert if CPU usage exceeds 80%.                                                                                                                                                                  

## Usage
1. Clone or Download the Script:
   Clone the repository or download the script to your local machine.

2. Make the Script Executable:
   ```bash
      chmod +x system_monitor.sh
3. Run the Script:
   ```bash
     ./system_monitor.sh
   
The script will refresh every 5 seconds, displaying the latest system metrics and alerts.

## Requirements
The script requires a Unix-like operating system with the following commands available:
bash
top
free
df
ip
awk
uptime

## Notes
The network activity is monitored for the eth0 interface. You may need to modify the script to use the correct network interface name for your system.
The alert threshold for CPU usage can be adjusted in the check_alerts function.
