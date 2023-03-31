FROM mysql:5.7
COPY ./deploy/mysql/mysql-docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d/
COPY ./deploy/mysql/init/start.sh /root/start.sh

ENV TIME_ZONE=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone
# 设置配置文件的权限，不然的话 mysqld 会忽略配置文件并打印这样的 warning:
# mysqld: [Warning] World-writable config file '/etc/mysql/mysql.conf.d/mysql.cnf' is ignored.
RUN chmod 0644 /etc/mysql/mysql.conf.d/mysqld.cnf

#RUN apt-get update -y
#RUN apt-get upgrade -y
#RUN apt-get install ssh -y
#RUN apt-get -qO- https://get.docker.com/gpg | su apt-key add -

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29
#RUN rm /etc/apt/sources.list.d/cuda.list
#RUN rm /etc/apt/sources.list.d/nvidia-ml.list
#RUN sed -i s:/archive.ubuntu.com:/mirrors.tuna.tsinghua.edu.cn/ubuntu:g /etc/apt/sources.list
#RUN cat /etc/apt/sources.list
RUN apt-get clean
RUN apt-get -y update && apt-get -y install ssh

EXPOSE 3306
CMD ["/bin/bash", "/root/start.sh"]