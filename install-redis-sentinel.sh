count=3
node_name=redis_node_
sentinel_name=redis_sentinel_
i=0
while [ $i -lt $count ]
do
  i=$(( $i + 1 ))
  mkdir -pv $HOME/app/$node_name$i/conf
  mkdir -pv $HOME/app/$node_name$i/data
  mkdir -pv $HOME/app/$sentinel_name$i/data
  mkdir -pv $HOME/app/$sentinel_name$i/conf
  cp -v ./redis/redis.conf $HOME/app/$node_name$i/conf/redis.conf
  cp -v ./redis/sentinel.conf $HOME/app/$sentinel_name$i/conf/sentinel.conf
  sed -i 's/replica-announce-ip 127.0.0.1/replica-announce-ip '$node_name$i'/g' $HOME/app/$node_name$i/conf/redis.conf
  sed -i 's/sentinel announce-ip 127.0.0.1/sentinel announce-ip '$sentinel_name$i'/g' $HOME/app/$sentinel_name$i/conf/sentinel.conf
done
docker-compose -f redis/docker-compose-redis-node.yml -f redis/docker-compose-redis-sentinel.yml up -d --remove-orphans
