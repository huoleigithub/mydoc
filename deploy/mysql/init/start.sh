#!/bin/sh

cat /etc/mysql/mysql.conf.d/source/mysqld.cnf >  /etc/mysql/mysql.conf.d/mysqld.cnf

/entrypoint.sh mysqld