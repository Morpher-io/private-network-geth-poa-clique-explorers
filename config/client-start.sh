#!/bin/sh

DIR="/app/datadir/geth"
if [ ! -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "Installing config files in ${DIR}..."
  sed -i 's/"chainId": 21000/"chainId": '$NETWORK_CHAIN_ID'/' /app/genesis.json
  geth init --datadir=/app/datadir /app/genesis.json 

  
  echo "[\"enode://${ENODEPUB_1}@signer-1:30303\",\"enode://${ENODEPUB_2}@signer-2:30303\"]" > /app/datadir/static-nodes.json
fi
sleep 3;

ipaddress=$(hostname -i)

geth --bootnodes "enode://${ENODEPUB_1}@signer-1:30303,enode://${ENODEPUB_2}@signer-2:30303" --networkid="${NETWORK_CHAIN_ID}" --datadir=/app/datadir --http --http.addr="0.0.0.0" --http.port="8545" --http.corsdomain="*" --http.vhosts="*" --http.api="eth,net,web3,debug,txpool,trace" --ws  --ws.origins="*" --ws.addr="0.0.0.0" --ws.port="8546" --syncmode "full" --gcmode archive --nat extip:${ipaddress} --identity "Morpher Dev Demo Network"

