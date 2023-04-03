# mysql搭建主从
docker exec -it mysql_master /bin/bash /etc/init.d/3-mysql_init.sh
docker exec -it mysql_slave1 /bin/bash /etc/init.d/3-mysql_init.sh
docker exec -it mysql_slave2 /bin/bash /etc/init.d/3-mysql_init.sh
# 生成ssh key
docker exec -it mysql_master /bin/bash /etc/init.d/script/ssh_generate_key.sh
docker exec -it mysql_slave1 /bin/bash /etc/init.d/script/ssh_generate_key.sh
docker exec -it mysql_slave2 /bin/bash /etc/init.d/script/ssh_generate_key.sh
docker exec -it mha_manager /bin/bash /etc/init.d/script/ssh_generate_key.sh
# 授权ssh key
docker exec -it mysql_master /bin/bash /etc/init.d/script/ssh_auth_keys.sh
docker exec -it mysql_slave1 /bin/bash /etc/init.d/script/ssh_auth_keys.sh
docker exec -it mysql_slave2 /bin/bash /etc/init.d/script/ssh_auth_keys.sh
docker exec -it mha_manager /bin/bash /etc/init.d/script/ssh_auth_keys.sh
# 启动 MHA
# docker exec mha_manager /bin/bash /etc/init.d/mha_manager.sh