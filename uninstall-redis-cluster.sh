node_count=6
container_name=redis_node_
container_names=`seq -f $container_name'%1g' 1 $node_count`

uninstall() {
  echo 'Stopping redis cluster...'
  docker stop $container_names
  echo 'Removing redis cluster...'
  docker rm $container_names
  docker rm redis_cluster
  echo 'Removing network redis-cluster_redis'
  docker network rm redis-cluster_redis
  echo 'Uninstall success.'
}

delete_files() {
  makesure 'Do you want to delete configure and data files? [Y/n] '
  if [ $? -eq 1 ]; then
    echo 'Deleting files...'
    dir_nodes=`seq -f $HOME'/app/'$container_name'%1g' 1 $node_count`;
    echo $dir_nodes | xargs -n 1 sudo rm -rfv
  fi
  echo 'Done.'
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
