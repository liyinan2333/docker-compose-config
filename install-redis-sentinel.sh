count=3
server_name=redis_server_
sentinel_name=redis_sentinel_
i=0
while [ $i -lt $count ]
do
  i=$(( $i + 1 ))
  mkdir -pv $HOME/app/$server_name$i/conf
  mkdir -pv $HOME/app/$server_name$i/data
  mkdir -pv $HOME/app/$sentinel_name$i/data
  mkdir -pv $HOME/app/$sentinel_name$i/conf
  cp -v ./redis/redis-sentinel/redis.conf $HOME/app/$server_name$i/conf/redis.conf
  cp -v ./redis/redis-sentinel/sentinel.conf $HOME/app/$sentinel_name$i/conf/sentinel.conf
  sed -i 's/replica-announce-ip 127.0.0.1/replica-announce-ip '$server_name$i'/g' $HOME/app/$server_name$i/conf/redis.conf
  sed -i 's/sentinel announce-ip 127.0.0.1/sentinel announce-ip '$sentinel_name$i'/g' $HOME/app/$sentinel_name$i/conf/sentinel.conf
done
docker-compose -f redis/redis-sentinel/docker-compose-redis-server.yml -f redis/redis-sentinel/docker-compose-redis-sentinel.yml up -d --remove-orphans
