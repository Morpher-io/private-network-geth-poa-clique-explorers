#!/bin/sh

DIR="/app/datadir/geth"
if [ ! -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "Installing config files in ${DIR}..."
  geth init /app/genesis.json --datadir=/app/datadir

  echo ${SIGNERKEY} > /app/key
  geth account import --datadir=/app/datadir --password <(echo $SIGNERPW) /app/key
  rm /app/key

  echo "[\"enode://${ENODEPUB_1}@signer-1:30303\",\"enode://${ENODEPUB_2}@signer-2:30303\"]" > /app/datadir/static-nodes.json
fi
sleep 3;

ipaddress=$(hostname -i)

geth --bootnodes "enode://${ENODEPUB_1}@signer-1:30303,enode://${ENODEPUB_2}@signer-2:30303" --verbosity 8 --gcmode archive --networkid="210" --datadir=/app/datadir --http --http.addr="0.0.0.0" --http.port="8545" --http.corsdomain="*" --http.vhosts="*" --http.api="eth,net,web3" --allow-insecure-unlock --miner.etherbase=$SIGNERADD --mine --miner.gasprice 1 --unlock $SIGNERADD --password <(echo $SIGNERPW) -nodekey <(echo ${SIGNERKEY:?NOT SET})  --nat extip:${ipaddress}
