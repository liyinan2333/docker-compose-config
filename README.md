# docker-compose-config

### Network planning

| Server    | Network        | Driver | Subnet         | Gateway     |
| --------- | -------------- | ------ | -------------- | ----------- |
| MySQL     | generic        | bridge | 172.100.0.0/16 | 172.100.0.1 |
| Redis     | redis          | bridge | 172.79.0.0/16  | 172.79.0.1  |
| Zookeeper | zookeeper      | bridge | 172.81.0.0/16  | 172.81.0.1  |
| ActiveMQ  | activemq       | bridge | 172.61.0.0/16  | 172.61.0.1  |
| Consul    | consul_default | bridge | default        | default     |