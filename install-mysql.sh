mkdir -p ~/app/mysql/conf/
mkdir -p ~/app/mysql/data/
cp ./mysql/my.cnf ~/app/mysql/conf/my.cnf
docker-compose -f mysql/docker-compose-mysql.yml up -d --remove-orphans
