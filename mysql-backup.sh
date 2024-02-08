#!/bin/bash

MYSQL_POD=mysql-statefulset-0
USERNAME=root
PASSWORD=root
DB_NAME=devopscube

# Database Schema Backup
kubectl exec -it $MYSQL_POD -- mysqldump -u $USERNAME -p$PASSWORD --all-databases > schema_backup.sql

# Data Backup (adjust database_name as needed)
kubectl exec -it $MYSQL_POD -- mysqldump -u $USERNAME -p$PASSWORD $DB_NAME > data_backup.sql

# Copy backup files locally
# kubectl cp $MYSQL_POD:/path/to/schema_backup.sql ./schema_backup.sql
# kubectl cp $MYSQL_POD:/path/to/data_backup.sql ./data_backup.sql
