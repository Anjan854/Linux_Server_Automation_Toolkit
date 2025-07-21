#!/bin/bash

CPU_LIMIT=80
MEM_LIMIT=90
DISK_LIMIT=90

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
MEM=$(free | awk '/Mem:/ {printf("%.0f\n", $3/$2 * 100.0)}')
DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

alert_msg=""

[[ $CPU -gt $CPU_LIMIT ]] && alert_msg+="High CPU usage: $CPU%\n"
[[ $MEM -gt $MEM_LIMIT ]] && alert_msg+="High Memory usage: $MEM%\n"
[[ $DISK -gt $DISK_LIMIT ]] && alert_msg+="Low disk space: $DISK%\n"

if [[ -n $alert_msg ]]; then
    echo -e "$alert_msg" | mailx -s "System Resource Alert" anjonmahmud4@gmail.com
    echo "[!] Resource limits exceeded. Alert sent."
else
    echo "[+] System resources are within normal limits."
fi

