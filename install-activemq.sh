count=3
zookeeper_count=3
network_name=activemq
mkdir -pv `seq -f "$HOME/app/amq%1g/data" 1 $count`
mkdir -pv `seq -f "$HOME/app/amq%1g/log" 1 $count`
mkdir -pv `seq -f "$HOME/app/amq%1g/conf" 1 $count`
find ~/app -wholename "*amq[1-3]/conf" | xargs -n 1 cp -v ./activemq/activemq.xml
# Init activemq network.
./init_network.sh $network_name
# Connect activemq network to zookeeper network.
echo `seq -f "zk%1g" 1 $zookeeper_count` | xargs -n1 | xargs -i docker network connect activemq {}
docker-compose -f activemq/docker-compose-activemq.yml up -d --remove-orphans
