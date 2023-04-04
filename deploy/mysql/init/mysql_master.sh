#!/bin/bash
echo ">>>>start to init master"
set +els no-exit-filewhoami
# 创建用于同步的用户
MYSQL_PWD=${MYSQL_ROOT_PASSWORD} mysql -u root -e "CREATE USER '${MYSQL_REPLICATION_USER}'@'%' IDENTIFIED BY '${MYSQL_REPLICATION_PASSWORD}'; GRANT REPLICATION SLAVE ON *.* TO '${MYSQL_REPLICATION_USER}'@'%' IDENTIFIED BY '${MYSQL_REPLICATION_PASSWORD}';"
# MYSQL_PWD=${MYSQL_ROOT_PASSWORD} mysql -u root -e "GRANT ALL ON *.* TO '${MYSQL_REPLICATION_USER}'@'172.25.0.204' IDENTIFIED BY '${MYSQL_REPLICATION_PASSWORD}'"