echo 'Stopping consul cluster...'
docker stop consul_client consul_server_1 consul_server_2 consul_server_3
echo 'Removing consul cluster...'
docker rm consul_client consul_server_1 consul_server_2 consul_server_3
echo 'Removing network consul_default...'
docker network rm consul_default
echo 'Uninstall success.'
