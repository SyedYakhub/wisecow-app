#!/bin/bash

# Configuration
SOURCE_DIR="/root/wisecow_creds"         # Local directory you want to back up
REMOTE_USER="ec2-user"                   # Username on the remote server
REMOTE_HOST="placeholder_ip"             # Address of the remote server [sensitive information has been replaced with placeholders for security reasons]
REMOTE_DIR="/home/ec2-user/creds"        # Directory on the remote server where the backup will be stored
LOG_FILE="/root/backup.log"              # Local file where you'll save the log

# Perform Backup
{
    echo "Starting backup at $(date)"
    scp -r $SOURCE_DIR $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR
    # Check if the command succeeded
    if [ $? -eq 0 ]; then
        echo "Backup completed successfully at $(date)"
    else
        echo "Backup failed at $(date)"
    fi
} | tee -a $LOG_FILE

