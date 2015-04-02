### rsyncbackup

rsync backup the mysql databases and /home/ directory to a remote rsync host.

* rsyncbackup.sh
  * Dumps mysql databases into a /home/ directory
  * rsyncs those and a set of /home/ dirs to an rsync host
  * Ignore mysql databases (ie metadata) and nonessential /home/ directories
    
* runbackup.sh
  * Run the rsyncbackup.sh script
  * Stores the output to a log file
  * Email the log file to the root user

