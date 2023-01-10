count=3
zookeeper_count=3
network_name=activemq
container_short_name=amq
container_full_name=activemq
container_short_names=`seq -f "$container_short_name%1g" 1 $count`

uninstall() {
  echo "Stopping $container_full_name cluster..."
  docker stop $container_short_names
  echo "Removing $container_full_name cluster..."
  docker rm $container_short_names
  echo "Disconnecting network zookeeper from activemq..."
  echo `seq -f "zk%1g" 1 $zookeeper_count` | xargs -n1 | xargs -i docker network disconnect activemq {} 
  echo "Removing network $network_name..."
  docker network rm $network_name
  echo "Uninstall success."
}

delete_files() {
  makesure "Do you want to delete configure and data files? [Y/n] "
  if [ $? -eq 1 ]; then
    echo "Deleting files..."
    dir=`seq -f "$HOME/app/$container_short_name%1g" 1 $count`;
    echo $dir | xargs -n 1 sudo rm -rfv
  fi
  echo "Done."
}

makesure() {
  echo $1
  read -r input
  case $input in
      [yY][eE][sS]|[yY])
        echo "Yes"
	return 1
        ;;
      [nN][oO]|[nN])
        echo "No"
	return 0
        ;;
      *)
        echo "Invalid input..."
        exit 1
        ;;
  esac
}

main() {
  uninstall
  delete_files
}

main
