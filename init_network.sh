# config
default_name="generic"
default_gateway="172.100.0.1"
default_subnet="172.100.0.0/16"
name=${1:-$default_name}
gateway=$2
subnet=$3

create_network() {
  if [ `docker network ls | grep -w $name | wc -l` -eq 0 ];
  then
    echo "Network $name is not exists, will be create..."
    if [ ! $gateway ] && [ ! $subnet ];
    then
      docker network create -d bridge $name
      echo "Network $name created. [gateway=default, subnet=default]"
    else
      docker network create -d bridge --gateway $gateway --subnet $subnet $name
      echo "Network $name created. [gateway=$gateway, subnet=$subnet]"
    fi
  else
    echo "Network $name already exists, no need to create again."
  fi
}

init_param() {
  if [ "$name" = "$default_name" ];
  then
    gateway=$default_gateway
    subnet=$default_subnet
  fi
}

main() {
  init_param
  create_network
}

main
