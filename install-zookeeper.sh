mkdir -p ~/app/zk1/conf/
mkdir -p ~/app/zk1/data/
mkdir -p ~/app/zk2/conf/
mkdir -p ~/app/zk2/data/
mkdir -p ~/app/zk3/conf/
mkdir -p ~/app/zk3/data/
cp ./zookeeper/zoo1.cfg ~/app/zk1/conf/zoo.cfg
cp ./zookeeper/zoo2.cfg ~/app/zk2/conf/zoo.cfg
cp ./zookeeper/zoo3.cfg ~/app/zk3/conf/zoo.cfg
docker-compose -f zookeeper/docker-compose-zookeeper.yml up -d --remove-orphans
