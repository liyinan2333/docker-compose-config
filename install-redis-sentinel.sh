count=3
node_names=`seq -f 'redis_node_%1g' 1 $count`
#创建目录
mkdir -pv `seq -f $HOME'/app/redis_node_%1g/conf' 1 $count`
mkdir -pv `seq -f $HOME'/app/redis_node_%1g/data' 1 $count`
mkdir -pv `seq -f $HOME'/app/redis_sentinel_%1g/data' 1 $count`
mkdir -pv `seq -f $HOME'/app/redis_sentinel_%1g/conf' 1 $count`
#复制配置文件
redis_node_conf_path=`seq -f $HOME'/app/redis_node_%1g/conf/redis.conf' 1 $count`
redis_sentinel_conf_path=`seq -f $HOME'/app/redis_sentinel_%1g/conf/sentinel.conf' 1 $count`
echo $redis_node_conf_path | xargs -n 1 cp -v ./redis/redis.conf
echo $redis_sentinel_conf_path | xargs -n 1 cp -v ./redis/sentinel.conf
#修改配置文件
echo $node_names | xargs -0 -n1 -i sed -i 's/replica-announce-ip 127.0.0.1/replica-announce-ip '{}'/g' $HOME'/app/'{}'/conf/redis.conf'
docker-compose -f redis/docker-compose-redis-node.yml -f redis/docker-compose-redis-sentinel.yml up -d --remove-orphans
