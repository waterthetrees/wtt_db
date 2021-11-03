#!/bin/bash

echo "${POSTGRES_USER} ${POSTGRES_DB}" 
echo "username:password ${DB_USER}:${DB_PASSWORD} database ${DB_NAME}" 
echo "${POSTGRES_USER}" == "postgres"


psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER trees WITH ENCRYPTED PASSWORD 'trees3r4t';
    CREATE DATABASE treedb;
    GRANT ALL PRIVILEGES ON DATABASE treedb TO trees;
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
EOSQL

# if [ "${POSTGRES_USER}" == "postgres" ]; then

# echo "Creating Postgres Username: ${DB_USER}"
# psql -U postgres -c "CREATE USER ${DB_USER} WITH ENCRYPTED PASSWORD '${DB_PASSWORD}';"

# echo "Creating database: ${DB_NAME}"
# psql -U postgres -c "CREATE DATABASE '${DB_NAME}' IF NOT EXISTS WITH OWNER '${DB_USER}' ENCODING 'UTF8' TEMPLATE template0;"

# echo "Granting privileges on database ${DB_NAME} to DB_USER: ${DB_USER}"
# psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE '${DB_NAME}' TO '${DB_USER}';"

echo "Copying data: ${DB_NAME}"
psql -f /db-dumps/treedb.sql treedb
# psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"  < /docker-entrypoint-initdb.d/treedb.sql
echo "Copied data: ${DB_NAME}"

# else
#     echo "${POSTGRES_USER} failed to create database: ${DB_NAME}"
# fi