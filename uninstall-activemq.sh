uninstall() {
  echo 'Stopping amq cluster...'
  docker stop amq1 amq2 amq3
  echo 'Removing amq cluster...'
  docker rm amq1 amq2 amq3
  echo 'Uninstall success.'
}

delete_files() {
  makesure 'Whether to delete config and data files? [Y/n] '
  if [ $? = 1 ]; then
    sudo rm -rf ~/app/amq{1..3}
  fi
  echo 'Done.'
}

makesure() {
  echo $1
  read -r input
  case $input in
      [yY][eE][sS]|[yY])
        echo "Yes"
        sudo rm -rf ~/app/amq{1..3}:
        ;;
      [nN][oO]|[nN])
        echo "No"
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
