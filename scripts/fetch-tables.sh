#!/bin/bash

OUTPUT=tables
USER=trees
DATABASE=treedb
SCHEMA=public
HOSTNAME=localhost

help()
{
   echo "Add tables from database into a "
   echo
   echo "Syntax: ./scripts/fetch-tables.sh [-o|U|s|h|v|help]"
   echo "options:"
   echo "-o           Output directory. Default is tables."
   echo "-U           Database user. Default is postgres"
   echo "-s           Database schema. Default is public."
   echo "-h           Database host. Default is localhost.."
   echo "--help       Display help."
   echo
}

while true; do
    case "$1" in
        --help) # display Help
            help
            exit;;
        -o)
            shift;
            OUTPUT=$1;
            ;;
        -U)
            shift;
            USER=$1;
            ;;
        -s)
            shift;
            SCHEMA=$1;
            ;;
        -h)
            shift;
            HOSTNAME=$1;
            ;;
        *)
            break
            ;;
    esac
    shift
done

read -s -p "Password for postgres: " passwd

for table in $(PGPASSWORD=$passwd psql -U $USER -d $DATABASE -h $HOSTNAME -t -c "select schemaname || '.' || tablename as table from pg_catalog.pg_tables where schemaname = '$SCHEMA'");
do
    echo "Fetching schema for $table";
    # filter out all the pg_dump comments and SET statements, then
    # ignore the first 6 lines which are all blank because we skipped so much stuff
    PGPASSWORD=$passwd pg_dump -U $USER -d $DATABASE -h $HOSTNAME -s --table $table \
        | grep -v "^--" | grep -v "^SET " | grep -v "^SELECT pg_catalog.set_config" \
        | tail +6 \
        > $OUTPUT/$table.sql;
done
