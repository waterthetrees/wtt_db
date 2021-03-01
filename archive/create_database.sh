#!/bin/bash

set -e
TEST=true

DB_NAME=${1:-treedb}
DB_USER=${2:-trees}
DB_USER_PASS=${3:-trees3r4t}
SQL_FILENAME=${4:-treedb.sql}
DB_TABLE1=${5:-treedata}
DB_TABLE2=${6:-treehistory}
DB_TABLE3=${7:-users}

# DB_NAME=${1:-treedb}
# DB_USER=${2:-trees}
# DB_USER_PASS=${3:-trees3r4t}
# SQL_FILENAME=${3:-db/trees3r4t}

# sudo su postgres <<EOF
createdb $DB_NAME;
psql -c "CREATE USER $DB_USER WITH ENCRYPTED PASSWORD '$DB_USER_PASS';"
psql -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME to $DB_USER;"
psql -c "ALTER USER $DB_USER CREATEDB;"
psql -c 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";'
# psql -c "CREATE TABLE $DB_TABLE1;"
# psql -c "CREATE TABLE $DB_TABLE2;"
# psql -c "CREATE TABLE $DB_TABLE3;"
psql -U "$DB_USER" -d "$DB_NAME" < "db/$SQL_FILENAME"

echo "Postgres User '$DB_USER' and database '$DB_NAME' created."