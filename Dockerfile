FROM postgis/postgis

ADD init-db.sh /docker-entrypoint-initdb.d/
ADD treedb.sql /db-dumps/
RUN ["chmod", "+x", "/docker-entrypoint-initdb.d/init-db.sh"]