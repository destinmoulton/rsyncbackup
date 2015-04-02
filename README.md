Here are two examples of bash scripts I wrote to 
manage backups on a remote server.

--> rsyncbackup.sh
    A backup tool that dumps all the databases and then rsyncs 
    those and a set of /home/ dirs to an rsync host.
    
--> runbackup.sh
    A basic bash stub file that calls the rsyncbackup.sh
    script, stores the output to a log file,
    and emails the log file to the root user.

