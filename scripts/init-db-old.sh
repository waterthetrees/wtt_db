#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

POSTGRES_USER="${POSTGRES_USER:-postgres}"
POSTGRES_PASSWORD="${POSTGRES_PASSWORD}"
APP_POSTGRES_DB="${APP_POSTGRES_DB:-treedb}"
APP_POSTGRES_USER="${APP_POSTGRES_USER:-trees}"
APP_POSTGRES_PASSWORD="${APP_POSTGRES_PASSWORD:-trees3r4t}"
SQL_FILENAME=${SQL_FILENAME:-treedb.sql}

DATABASE="${APP_POSTGRES_DB}"

# Create single database.
psql --variable ON_ERROR_STOP=1 --username "${POSTGRES_USER}" --command "CREATE DATABASE ${DATABASE}"

# Create app user.
psql --variable ON_ERROR_STOP=1 --username "${POSTGRES_USER}" --command "CREATE USER ${APP_POSTGRES_USER} SUPERUSER PASSWORD '${APP_POSTGRES_PASSWORD}'"
psql --variable ON_ERROR_STOP=1 --username "${POSTGRES_USER}" --command "GRANT ALL PRIVILEGES ON DATABASE ${DATABASE} TO ${APP_POSTGRES_USER}"
psql --variable ON_ERROR_STOP=1 --username "${POSTGRES_USER}" --command "ALTER USER ${APP_POSTGRES_USER} CREATEDB;"
psql --variable ON_ERROR_STOP=1 --username "${POSTGRES_USER}" --command 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";'
psql --variable --username "${APP_POSTGRES_USER}" --dbname "${DATABASE}" < /docker-entrypoint-initdb.d/"$SQL_FILENAME"