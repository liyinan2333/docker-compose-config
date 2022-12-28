count=3
mkdir -pv `seq -f $HOME'/app/zk%1g/conf' 1 $count`
mkdir -pv `seq -f $HOME'/app/zk%1g/data' 1 $count`
find ~/app -wholename '*zk[1-3]/conf' | xargs -n 1 cp -v ./zookeeper/zoo.cfg
docker-compose -f zookeeper/docker-compose-zookeeper.yml -f zookeeper/docker-compose-zookeeper.yml up -d --remove-orphans
