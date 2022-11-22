mkdir -p ~/app/activemq/data/
mkdir -p ~/app/activemq/log/
docker-compose -f activemq/docker-compose-activemq.yml up -d --remove-orphans
