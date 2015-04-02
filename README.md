### rsyncbackup

rsync backup the mysql databases and /home/ directory to a remote rsync host.

* rsyncbackup.sh
    A backup tool that dumps all the databases and then rsyncs those and a set of /home/ dirs to an rsync host.
    
* runbackup.sh
    A basic bash stub file that calls the rsyncbackup.sh script, stores the output to a log file, then emails the log file to the root user.

