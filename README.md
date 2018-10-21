# Backup RDS MySQL and Postgres databases locally

##This repository has guidance and scripts to backup RDS locally

1. Backup RDS and Aurora Postgres databases locally using pg_dump

This will create a backup of all the databases using pgdump Postgres utility on your local machine. Each database generates a different backup file, and user would need to input the password when requested in the script. This will ignore the default databases in RDS and Aurora Postres instances and backup the user databases only.

[Link to script](https://github.com/shivamgulati1991/Backup-RDS-Database/blob/master/RDSpgdump.sh)

2. Backup RDS and Aurora MySQL databases locally using mysqldump

This will take a dump of the specific database from RDS and Aurora MySQL databases to your local machine.

[Link to script](https://github.com/shivamgulati1991/Backup-RDS-Database/blob/master/RDSmysqldump.sh)
