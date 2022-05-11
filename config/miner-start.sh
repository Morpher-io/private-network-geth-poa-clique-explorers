#!/bin/sh

DIR="/app/datadir/geth"
if [ ! -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "Installing config files in ${DIR}..."
  geth init /app/genesis.json --datadir=/app/datadir

  echo ${SIGNERKEY} > /app/key
  geth account import --datadir=/app/datadir --password <(echo $SIGNERPW) /app/key
  rm /app/key
fi
sleep 3;

geth --bootnodes enode://${ENODEPUB}@bootnode:30301 --networkid="210" --datadir=/app/datadir --http --http.addr="0.0.0.0" --http.port="8545" --http.corsdomain="*" --http.vhosts="*" --http.api="eth,net,web3" --allow-insecure-unlock --miner.etherbase=$SIGNERADD --mine --unlock $SIGNERADD --password <(echo $SIGNERPW)