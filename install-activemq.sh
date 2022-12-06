mkdir -p ~/app/amq1/conf/
mkdir -p ~/app/amq1/data/
mkdir -p ~/app/amq1/log/
mkdir -p ~/app/amq2/conf/
mkdir -p ~/app/amq2/data/
mkdir -p ~/app/amq2/log/
mkdir -p ~/app/amq3/conf/
mkdir -p ~/app/amq3/data/
mkdir -p ~/app/amq3/log/
cp ./activemq/activemq_1.xml ~/app/amq1/conf/activemq.xml
cp ./activemq/activemq_2.xml ~/app/amq2/conf/activemq.xml
cp ./activemq/activemq_3.xml ~/app/amq3/conf/activemq.xml
docker-compose -f activemq/docker-compose-activemq.yml up -d --remove-orphans
