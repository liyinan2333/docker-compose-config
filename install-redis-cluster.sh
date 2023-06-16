node_count=6
container_name=redis_node_
ip_prefix=172.79.0.1
i=0
while [ $i -lt $node_count ]
do
  i=$(( $i + 1 ))
  full_container_name=$container_name$i
  # 创建节点目录和文件
  mkdir -pv $HOME/app/$full_container_name/conf
  mkdir -pv $HOME/app/$full_container_name/data
  cp -v ./redis/redis-cluster/redis.conf $HOME/app/$full_container_name/conf/redis.conf
  # 修改节点配置
  sed -i 's/cluster-announce-ip 127.0.0.1/cluster-announce-ip '$ip_prefix$i'/g' $HOME/app/$full_container_name/conf/redis.conf
done
docker-compose -f redis/redis-cluster/docker-compose-redis-cluster.yml up -d --remove-orphans
