#!/bin/bash
# @author Destin Moulton
#
# An rsync backup script. 
# This script performs a backup of the /home/ directory.
# This is geared towards cpanel installations.
#
# This script performs three backup tasks:
# 1. It backs up mysql databases to a directory (inside /home/ in this case).
# 2. It rsync's the /home/ directories.
# 3. Outputs information for logging.
#
# This script should be called via something similar to the runbackup.sh script
# so that the logged/output information is useful.
#
# NOTE: Make sure /home/mysql backup exists (or whatever you set the mysql backup dir inside /home/).

# mysql connection information (root level priveleges required)
MYSQL_BACKUP_DIR='/home/mysql_backup'
MYSQL_USER='root'
MYSQL_PASS=''

# rsync host information
RSYNC_HOST=''
RSYNC_USER=''
RSYNC_PATH=''

# Get a list of all the user space databases (ignoring a specific set of meta databases)
databases=`mysql --user=$MYSQL_USER --password=$MYSQL_PASS -e 'SHOW DATABASES;'|grep -Ev '(Database|information_schema|mysql|cphulkd|eximstats|horde|leechprotect|modsec|roundcube)'`

# Dump and gzip the db's into the mysql backup folder
for db in $databases; do
	echo "Backing up mysql database: $db"
	echo `mysqldump --opt --hex-blob --force --user=$MYSQL_USER --password=$MYSQL_PASS $db | gzip > $MYSQL_BACKUP_DIR/$db.gz`
done

# The /home/ location
home="/home/"

# Get a list of /home/ directories
# This will include the mysql_backup directory
# You can add/remove --ignore= options; these are useful for cpanel meta data.
ls_cmd="ls --ignore=virtfs --ignore=cpeasyapache --ignore=cptmp --ignore=cprestore --ignore=MySQL-install --ignore=tmp --ignore=test $home"
		   
# Loop through the listed dirs and rsync each one
for dir in `$ls_cmd`
do
	path="$home$dir"
	if [ -d "$path" ] ; then
		echo $path
		du -ch $path | grep total
		rsync -avz -e ssh $path $RSYNC_USER@$RSYNC_HOST:$RSYNC_PATH
	fi
done
