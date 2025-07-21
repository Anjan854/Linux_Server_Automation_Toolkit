#!/bin/bash

LOG_DIR="/var/log"
DAYS_OLD=7

echo "[*] Cleaning logs older than $DAYS_OLD days from $LOG_DIR"
find "$LOG_DIR" -type f -mtime +$DAYS_OLD -exec rm -f {} \; 2>/dev/null
echo "[+] Log cleanup completed."

