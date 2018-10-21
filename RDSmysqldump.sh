#!/bin/bash
endpoint= <RDS_Endpoint>
user= <Username>
dbname = <Database name>
mysqldump -h $endpoint -u $user -p $dbname > dump.sql
