#!/bin/bash

# Variables
LOCAL_BACKUP_DIR="$HOME/ghq/github.com/timmyb824/docker-apps/Productivity/Active/hoarder/backups" 
NAS_BACKUP_DIR="/mnt/bryantnas/remote_file_backups/podman-01/hoarder_backups"              # Path to the NAS backup directory
LOG_FILE="/var/log/hoarder_backups_to_nas.log"                 # Log file for the script

if ! [ -d "$NAS_BACKUP_DIR" ] || ! ls "$NAS_BACKUP_DIR" &>/dev/null; then
    echo "$(date): NAS is not accessible. Exiting." | tee -a "$LOG_FILE"
    exit 1
fi

# Sync backups using rsync
if sudo rsync -avh --delete "$LOCAL_BACKUP_DIR" "$NAS_BACKUP_DIR"; then
    echo "$(date): Backups synced successfully to $NAS_BACKUP_DIR."
else
    echo "$(date): Error syncing backups to $NAS_BACKUP_DIR." | tee -a "$LOG_FILE"
fi
