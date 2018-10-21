#!/bin/bash
endpoint= <RDS_Endpoint>
user= <Username> 
while read dbs
do 
    dbList+=("$dbs")
done < <(psql -h $endpoint -t -d postgres -U $user -c "SELECT datname FROM pg_database WHERE datistemplate = false;")
#take dump for databases
for dbName in "${dbList[@]}"
do
	if [ "$dbName" != "rdsadmin" ] && [ "$dbName" != "postgres" ] && [ "$dbName" != "" ]; then
		echo "Database Name: $dbName"
		echo "Backup file name: dump+$dbName.sql"
		pg_dump -h $endpoint -U $user -p 5432 -f dump+$dbName.sql $dbName
		echo "Database dump completed for database: $dbName" 
	fi	
done
