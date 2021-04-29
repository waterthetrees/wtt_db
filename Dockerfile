FROM postgis/postgis

ADD init-db.sh /docker-entrypoint-initdb.d/
# ADD treedb.sql /db-dumps/
ADD treedb.tar.gz /db-dumps/
# RUN ["chmod", "+x", "/docker-entrypoint-initdb.d/init-db.sh"]