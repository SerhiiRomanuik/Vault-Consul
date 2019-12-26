#!/bin/bash


# CONSUL
docker-compose up -d consul
consul_ip=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aqf "name=consul")`
sed -i "s/consul_ip/$consul_ip/g" vault.json docker-compose.yml && \

# VAULT
docker-compose up -d vault
vault_ip=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aqf "name=vault") | sed -n 1p`
sed -i "s/vault_ip/$vault_ip/g" docker-compose.yml && \

# UNSEALING
echo "Visit Vault page (http://$vault_ip:8200) and store credentials, please." && \
read -sp 'Enter root token: ' root_token
sed -i "s/root_token/$root_token/" docker-compose.yml && \

# CLIENT
docker-compose build && \
docker-compose up -d client && \
docker cp ./client_config.sh $(docker ps -aqf "name=client"):/client_config.sh && \
docker exec -d $(docker ps -aqf "name=client") bash client_config.sh

# consul snapshot restore backup-v1.snap