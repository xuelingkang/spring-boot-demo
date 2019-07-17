#/bin/bash
docker run -d --name redis6381 \
-v /mnt/redis/6381:/data \
-v /etc/localtime:/etc/localtime \
--network host \
redis:alpine \
redis-server --appendonly yes \
--port 6381 \
--requirepass demo \
--slave-read-only yes \
--slaveof server01 6379 \
--masterauth demo