count=3
mkdir -pv `seq -f $HOME'/app/amq%1g/conf/data' 1 $count`
mkdir -pv `seq -f $HOME'/app/amq%1g/conf/log' 1 $count`
mkdir -pv `seq -f $HOME'/app/amq%1g/conf/conf' 1 $count`
find ~/app -wholename '*amq[1-3]/conf' | xargs -n 1 cp -v ./activemq/activemq.xml
docker-compose -f zookeeper/docker-compose-zookeeper.yml -f activemq/docker-compose-activemq.yml up -d --remove-orphans
