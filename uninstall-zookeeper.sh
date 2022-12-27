uninstall() {
  echo 'Stopping zookeeper cluster...'
  docker stop zk1 zk2 zk3
  echo 'Removing zookeeper cluster...'
  docker rm zk1 zk2 zk3
  echo 'Uninstall success.'
}

delete_files() {
  makesure 'Whether to delete config and data files? [Y/n] '
  if [ $? -eq 1 ]; then
    echo 'Deleting files...'
    sudo rm -rf $HOME/app/zk{1..3}
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
