#!/bin/bash
#
# @author Destin Moulton
# @license MIT
#
# Run the rsyncbackup.sh script, store the output in a log file
# and email the log file to the root linux user.
#
# NOTE: mutt must be installed

# Location of the rsyncbackup.sh script
RSYNC_BACKUP_LOCATION=""
cd RSYNC_BACKUP_LOCATION

# Run the backup script and put the output in a log file
./rsyncbackup.sh > backup_log.txt

# Email the log; subject includes the date
echo "The log is attached..." | mutt -a backup_log.txt -s "Backup - $(date)" root
