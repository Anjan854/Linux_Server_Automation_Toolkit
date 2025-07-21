#!/bin/bash

BACKUP_SRC="/home/anjon"
BACKUP_NAME="backup-$(date +%F).tar.gz"
S3_BUCKET="s3://linux-server-automation-bucket"

echo "[*] Creating backup of $BACKUP_SRC"
tar -czf "/tmp/$BACKUP_NAME" "$BACKUP_SRC"

echo "[*] Uploading to $S3_BUCKET"
aws s3 cp "/tmp/$BACKUP_NAME" "$S3_BUCKET"

if [[ $? -eq 0 ]]; then
    echo "[+] Backup uploaded successfully."
else
    echo "[!] Backup failed."
    echo "Backup to S3 failed" | mailx -s "Backup Failed" anjonmahmud4@gmail.com
fi

rm "/tmp/$BACKUP_NAME"

