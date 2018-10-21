#!/bin/bash
endpoint= <RDS_Endpoint>
user= <Username> 
while read dbs
do 
    dbList+=("$dbs")
done < <(psql -h $endpoint -t -d postgres -U $user -c "SELECT datname FROM pg_database WHERE datistemplate = false;")
#take dump for databases, change port in line 14 is not using default 5432
for dbName in "${dbList[@]}"
do
	if [ "$dbName" != "rdsadmin" ] && [ "$dbName" != "postgres" ] && [ "$dbName" != "" ]; then
		echo "DB Name: $dbName"
		echo "Backup name: dump+$dbName.sql"
		pg_dump -h $endpoint -U $user -p 5432 -f dump+$dbName.sql $dbName
		echo "Database dumped for database: $dbName" 
	fi	
done
