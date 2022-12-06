#!/bin/bash

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER trees WITH ENCRYPTED PASSWORD 'trees3r4t';
    CREATE DATABASE treedb;
    GRANT ALL PRIVILEGES ON DATABASE treedb TO trees;
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
EOSQL

psql -f /db-dumps/treedb.sql treedb

# psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"  < /docker-entrypoint-initdb.d/treedb.sql
echo "Copying data: ${POSTGRES_DB}"