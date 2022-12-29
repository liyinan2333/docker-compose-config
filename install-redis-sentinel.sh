count=3
mkdir -pv `seq -f $HOME'/app/redis_node_%1g/conf' 1 $count`
mkdir -pv `seq -f $HOME'/app/redis_node_%1g/data' 1 $count`
mkdir -pv `seq -f $HOME'/app/redis_sentinel_%1g/data' 1 $count`
mkdir -pv `seq -f $HOME'/app/redis_sentinel_%1g/conf' 1 $count`
cp -v ./redis/redis-node-1.conf $HOME'/app/redis_node_1/conf/redis.conf'
cp -v ./redis/redis-node-2.conf $HOME'/app/redis_node_2/conf/redis.conf'
cp -v ./redis/redis-node-3.conf $HOME'/app/redis_node_3/conf/redis.conf'
redis_sentinel_conf_path=`seq -f $HOME'/app/redis_sentinel_%1g/conf/sentinel.conf' 1 $count`
echo $redis_sentinel_conf_path | xargs -n 1 cp -v ./redis/sentinel.conf
docker-compose -f redis/docker-compose-redis-node.yml -f redis/docker-compose-redis-sentinel.yml up -d --remove-orphans
