count=3
server_name=redis_server_
sentinel_name=redis_sentinel_
server_names=`seq -f $server_name'%1g' 1 $count`
sentinel_names=`seq -f $sentinel_name'%1g' 1 $count`

uninstall() {
  echo 'Stopping redis sentinels...'
  docker stop $sentinel_names
  echo 'Stopping redis servers...'
  docker stop $server_names
  echo 'Removing redis sentinels...'
  docker rm $sentinel_names
  echo 'Removing redis servers...'
  docker rm $server_names
  echo 'Uninstall success.'
}

delete_files() {
  makesure 'Do you want to delete configure and data files? [Y/n] '
  if [ $? -eq 1 ]; then
    echo 'Deleting files...'
    dir_sentinel=`seq -f $HOME'/app/'$sentinel_name'%1g' 1 $count`;
    dir_server=`seq -f $HOME'/app/'$server_name'%1g' 1 $count`;
    echo $dir_sentinel | xargs -n 1 sudo rm -rfv
    echo $dir_server | xargs -n 1 sudo rm -rfv
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
