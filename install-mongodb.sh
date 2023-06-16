install() {
  mkdir -p ~/app/mongodb/logs/
  mkdir -p ~/app/mongodb/data/
  ./init_network.sh
  docker-compose -f mongodb/docker-compose-mongodb.yml up -d --remove-orphans
}

main() {
  install
}

main
