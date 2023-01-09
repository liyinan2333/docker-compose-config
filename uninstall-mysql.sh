count=1
container_short_name=mysql
container_full_name=mysql
container_short_names=`seq -f "$container_short_name%1g" 1 $count`

uninstall() {
  echo "Stopping $container_full_name..."
  docker stop $container_short_name
  echo "Removing $container_full_name..."
  docker rm $container_short_name
  echo "Uninstall success."
}

delete_files() {
  makesure "Do you want to delete configure and data files? [Y/n] "
  if [ $? -eq 1 ]; then
    echo "Deleting files..."
    dir="$HOME/app/$container_short_name"
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
