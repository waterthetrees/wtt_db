#!/bin/bash
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "cannot $*"; }

if [[ -d "backups" ]]; then
  echo "Directory backups already exists! Skipping..."
else
  mkdir backups
fi

DATABASE="treedb.sql"
BACKUP="backups/`date +%Y-%m-%d_%H%M`_${DATABASE}"

# backup the database
cp treedb.sql ${BACKUP};

if [[ -f ${BACKUP} ]]; then
  echo "database backup exists";
  # backup the database
  rm ${DATABASE};
  # export the new database
  pg_dump -w -c -U trees -h localhost -d treedb > "treedb.sql" 
else
  echo "didn't find backup";
fi

if [ $? -eq 0 ]
then
  echo "`date +%Y-%m-%d_%H:%M:%S`---backup ran successfully";
  exit 0;
else
  echo "`date +%Y-%m-%d_%H:%M:%S`---backup failed to run";
  exit 1;
fi
