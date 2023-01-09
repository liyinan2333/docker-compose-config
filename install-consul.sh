install() {
  docker-compose -f consul/docker-compose-consul.yml up -d --remove-orphans
}

main() {
  install
}

main
