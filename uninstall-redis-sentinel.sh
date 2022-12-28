count=3
container_redis_node_name=redis_node_
container_redis_sentinel_name=redis_sentinel_
container_redis_node_names=`seq -f $container_redis_node_name'%1g' 1 $count`
container_redis_sentinel_names=`seq -f $container_redis_sentinel_name'%1g' 1 $count`

uninstall() {
  echo 'Stopping redis sentinels...'
  docker stop $container_redis_sentinel_names
  echo 'Stopping redis nodes...'
  docker stop $container_redis_node_names
  echo 'Removing redis sentinels...'
  docker rm $container_redis_sentinel_names
  echo 'Removing redis nodes...'
  docker rm $container_redis_node_names
  echo 'Uninstall success.'
}

delete_files() {
  makesure 'Do you want to delete configure and data files? [Y/n] '
  if [ $? -eq 1 ]; then
    echo 'Deleting files...'
    dir_redis_sentinel=`seq -f $HOME'/app/'$container_redis_sentinel_name'%1g' 1 $count`;
    dir_redis_node=`seq -f $HOME'/app/'$container_redis_node_name'%1g' 1 $count`;
    echo $dir_redis_sentinel | xargs -n 1 sudo rm -rfv
    echo $dir_redis_node | xargs -n 1 sudo rm -rfv
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
