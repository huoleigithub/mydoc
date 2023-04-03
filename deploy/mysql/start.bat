docker exec -it mysql_master /bin/bash /etc/init.d/3-mysql_init.sh
docker exec -it mysql_slave1 /bin/bash /etc/init.d/3-mysql_init.sh
docker exec -it mysql_slave2 /bin/bash /etc/init.d/3-mysql_init.sh