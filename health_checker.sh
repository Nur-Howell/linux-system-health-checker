#!/bin/bash

echo "======= System Health Report ======="

mkdir -p logs
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
logfile="logs/system_report_$timestamp.txt"

{

hostname #Host name
whoami #User
date #Current Date
uname -r #Linux Kernal Version
uptime #CPU Load
echo ""

echo "===== Storage ====="
disk_usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//') #Disk Usage
echo "Usage: $disk_usage%"
echo ""

echo "===== Memory ====="
memory_total=$(free -h | awk 'NR==2 {print $2}' | sed 's/Gi//') #Memory 
memory_used=$(free -h | awk 'NR==2 {print $3}' | sed 's/Gi//')
memory_available=$(free -h | awk 'NR==2 {print $7}' | sed 's/Gi//')
echo "Total: $memory_total Used: $memory_used Available: $memory_available"
echo ""

echo "===== Services ====="
apache_act=$(systemctl is-active apache2) #Check apache2 running
ssh_act=$(systemctl is-active ssh) #Check ssh running

RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
RESET=$'\e[0m'

if [ "$apache_act" = "active" ]; then
echo "${GREEN}apache2 is running...${RESET}"
else
echo "${RED}apache2 is not running...${RED}"
fi

if [ "$ssh_act" = "active" ]; then
echo "${GREEN}ssh is running...${RESET}"
else
echo "${RED}ssh is not running...${RESET}"
fi

echo ""

} | tee "$logfile"

echo "Report saved to: $logfile"

