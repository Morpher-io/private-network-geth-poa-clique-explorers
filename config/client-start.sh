#!/bin/sh

DIR="/app/datadir/geth"
# if [ ! -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "Installing config files in ${DIR}..."
  sed -i 's/"chainId": 21000/"chainId": '$NETWORK_CHAIN_ID'/' /app/genesis.json
  geth init --datadir=/app/datadir /app/genesis.json 
  sed -i 's|StaticNodes = \[\]|StaticNodes = ["enode://'$ENODEPUB_1'@'$SIGNER1DOMAIN':30303","enode://'$ENODEPUB_2'@'$SIGNER2DOMAIN':30303"]|' /app/config.toml
  sed -i 's|BootstrapNodes = \[\]|BootstrapNodes = ["enode://'$ENODEPUB_1'@'$SIGNER1DOMAIN':30303","enode://'$ENODEPUB_2'@'$SIGNER2DOMAIN':30303"]|' /app/config.toml
  sed -i 's|BootstrapNodesV5 = \[\]|BootstrapNodesV5 = ["enode://'$ENODEPUB_1'@'$SIGNER1DOMAIN':30303","enode://'$ENODEPUB_2'@'$SIGNER2DOMAIN':30303"]|' /app/config.toml
  sed -i 's|SyncMode = "full"|SyncMode = "light"|' /app/config.toml
  sed -i 's|NoPruning = true|NoPruning = false|' /app/config.toml
  sed -i 's/NetworkId = 210/NetworkId = '$NETWORK_CHAIN_ID'/' /app/config.toml
  
  # echo "[\"enode://${ENODEPUB_1}@signer-1:30303\",\"enode://${ENODEPUB_2}@signer-2:30303\"]" > /app/datadir/static-nodes.json
# fi
sleep 3;

ipaddress=$(hostname -i)

geth --config /app/config.toml --identity "Morpher Dev Demo Network"

