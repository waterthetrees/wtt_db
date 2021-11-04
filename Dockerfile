FROM postgis/postgis

# ADD init.sql /db-dumps/
ADD init-db.sh /docker-entrypoint-initdb.d/
RUN ["chmod", "+x", "/docker-entrypoint-initdb.d/init-db.sh"]

ADD treedb.sql /db-dumps/

