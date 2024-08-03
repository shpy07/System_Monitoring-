#!/bin/bash

# Function to display the header
print_header() {
    clear
    echo "======================================="
    echo "     System Monitoring Dashboard       "
    echo "======================================="
}

# Function to display system metrics
display_metrics() {
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | awk '{print "  " $2 + $4 "% used"}'
    
    echo "Memory Usage:"
    free -m | awk 'NR==2{printf "  %.2f%% used\n", $3*100/$2 }'
    
    echo "Disk Usage:"
    df -h | awk '$NF=="/"{printf "  %s used\n", $5}'
    
    echo "Network Activity:"
    ip -s link show eth0 | awk '/RX:/ {getline; print "  Received: " $2 " bytes"} /TX:/ {getline; print "  Transmitted: " $2 " bytes"}'
    
    echo "System Uptime:"
    uptime -p | awk '{print "  "$0}'
}

# Function to check and trigger alerts
check_alerts() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    CPU_USAGE_INT=$(echo "$CPU_USAGE" | awk '{printf "%.0f", $1}')  # Convert to integer
    if [ "$CPU_USAGE_INT" -gt 80 ]; then
        echo -e "\e[31mALERT: High CPU usage - $CPU_USAGE%\e[0m"
    fi
}

# Main loop to refresh dashboard
while true; do
    print_header
    display_metrics
    check_alerts
    sleep 5
done

