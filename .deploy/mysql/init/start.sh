#!/bin/sh
cat /etc/mysql/mysql.conf.d/source/mysqld.cnf > /etc/mysql/mysql.conf.d/mysqld.cnf
cat /etc/init.d/init/3-mysql_init.sh > /etc/init.d/3-mysql_init.sh
chmod 0755 /etc/init.d/3-mysql_init.sh
sh /etc/init.d/3-mysql_init.sh
/entrypoint.sh mysqld