#!/bin/bash

LOG_FILE="./logs/automation-$(date +%F).log"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "===== Automation Toolkit Started: $(date) ====="

./scripts/log_cleanup.sh
./scripts/system_backup.sh
./scripts/system_monitor.sh

echo "===== Automation Toolkit Finished: $(date) ====="

