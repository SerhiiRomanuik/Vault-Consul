docker-compose up
#---------------------
# visit www -> http://127.0.0.1:8500/ui/, check status;
# visit www -> http://127.0.0.1:9200/ui/, check status, initiate and save keys for vault.
#---------------------
# unseal vault, check consul again.
# connect to the client via docker exec -ti client /bin/bash ;
docker exec -ti client /bin/bash
#---------------------
# update VAULT TOKEN AND ADDRESS :
# export VAULT_TOKEN=<vault root token>
# export VAULT_ADDR=<vault host :9200>
export VAULT_TOKEN=<vault root token>
export VAULT_ADDR=http://host.docker.internal:9200
#---------------------
#check vault status 
vault status
#Key             Value
#---             -----
#Seal Type       shamir
#Initialized     true
#Sealed          false
#Total Shares    1
#Threshold       1
#Version         1.3.0
#Cluster Name    vault-cluster-7bb2d426
#Cluster ID      19fffc03-1fbd-b1c6-2a41-a8f7647c2fb9
#HA Enabled      true
#HA Cluster      https://172.27.0.2:8201
#HA Mode         active
#---------------------
#enable KV secrets engine
vault secrets enable kv
#---------------------
#put something inside
vault kv put kv/my-secret my-value=s3cr3t
#---------------------
#enable versioning if needed
vault kv enable-versioning kv/my-secret
#---------------------
#---------------------
#---------------------
#creating snapshot :
# consul snapshot save backup.snap
#restoring from snapshot :
#consul snapshot restore backup.snap
#---------------------
#---------------------
#---------------------