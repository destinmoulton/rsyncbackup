#!/bin/bash

# @author Destin Moulton

# Run the backup script, store the output in a log file
# and email the log file to the root user.

cd /home/vps1_backup/
./backup.sh > backup_log.txt

#mail -s "Backup VPS3 - $(date)" -a backup_log.txt root < log_body.txt
echo "The log is attached..." | mutt -a backup_log.txt -s "Backup VPS1 - $(date)" root
