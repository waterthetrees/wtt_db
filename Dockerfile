FROM postgres

ADD init-db.sh /docker-entrypoint-initdb.d/
ADD treedb.sql /docker-entrypoint-initdb.d/
RUN ["chmod", "+x", "/docker-entrypoint-initdb.d/init-db.sh"]