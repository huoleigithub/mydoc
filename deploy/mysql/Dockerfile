FROM mysql:5.7.40
COPY ../mysql/mysql-schema.sql /docker-entrypoint-initdb.d/nacos-mysql.sql
COPY ../mysql/mydoc-user.sql /docker-entrypoint-initdb.d/mydoc-user.sql
COPY ../mysql/mydoc-document.sql /docker-entrypoint-initdb.d/mydoc-document.sql
COPY ../mysql/mydoc-api.sql /docker-entrypoint-initdb.d/mydoc-api.sql

RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/nacos-mysql.sql
RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/mydoc-user.sql
RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/mydoc-document.sql
RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/mydoc-api.sql
EXPOSE 3306
CMD ["mysqld", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci"]