count=3
network_name=activemq
mkdir -pv `seq -f "$HOME/app/amq%1g/data" 1 $count`
mkdir -pv `seq -f "$HOME/app/amq%1g/log" 1 $count`
mkdir -pv `seq -f "$HOME/app/amq%1g/conf" 1 $count`
find ~/app -wholename "*amq[1-3]/conf" | xargs -n 1 cp -v ./activemq/activemq.xml
./init_network.sh zookeeper
./init_network.sh activemq
docker-compose -f zookeeper/docker-compose-zookeeper.yml -f activemq/docker-compose-activemq.yml up -d --remove-orphans
