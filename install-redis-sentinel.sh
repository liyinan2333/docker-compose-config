count=3
mkdir -pv `seq -f $HOME'/app/redis_node_%1g/conf' 1 $count`
mkdir -pv `seq -f $HOME'/app/redis_node_%1g/data' 1 $count`
mkdir -pv `seq -f $HOME'/app/redis_sentinel_%1g/data' 1 $count`
mkdir -pv `seq -f $HOME'/app/redis_sentinel_%1g/etc' 1 $count`
find ~/app -wholename '*redis_node_[1-3]/conf' | xargs -n 1 cp -v ./redis/redis.conf
find ~/app -wholename '*redis_sentinel_[1-3]/etc' | xargs -n 1 cp -v ./redis/sentinel.conf
docker-compose -f redis/docker-compose-redis-node.yml -f redis/docker-compose-redis-sentinel.yml up -d --remove-orphans
