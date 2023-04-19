#!/bin/sh

DIR="/app/datadir/geth"
# if [ ! -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "Installing config files in ${DIR}..."
  sed -i 's/"chainId": 21000/"chainId": '$NETWORK_CHAIN_ID'/' /app/genesis.json
  # sed -i 's/"extraData": "0x00000000000000000000000000000000000000000000000000000000000000003c1ed3433916f130a7badf8b1ad770cfa2fd03bed96c84c682a298d964f517a61617a8be7cc67f04/"extraData": "0x0000000000000000000000000000000000000000000000000000000000000000'${SIGNERADD/"0x"/""}${SIGNER2ADD/"0x"/""}'/' /app/genesis.json
  sed -i 's|StaticNodes = \[\]|StaticNodes = ["enode://'$ENODEPUB_1'@signer-1:30303","enode://'$ENODEPUB_2'@signer-2:30303"]|' /app/config.toml
  sed -i 's|BootstrapNodes = \[\]|BootstrapNodes = ["enode://'$ENODEPUB_1'@signer-1:30303","enode://'$ENODEPUB_2'@signer-2:30303"]|' /app/config.toml
  sed -i 's|BootstrapNodesV5 = \[\]|BootstrapNodesV5 = ["enode://'$ENODEPUB_1'@signer-1:30303","enode://'$ENODEPUB_2'@signer-2:30303"]|' /app/config.toml
  sed -i 's/NetworkId = 210/NetworkId = '$NETWORK_CHAIN_ID'/' /app/config.toml
  geth init --datadir=/app/datadir /app/genesis.json 
  cat /app/genesis.json

  echo ${SIGNERKEY} > /app/key
  geth account import --datadir=/app/datadir --password <(echo $SIGNERPW) /app/key
  rm /app/key

  # echo "[\"enode://${ENODEPUB_1}@signer-1:30303\",\"enode://${ENODEPUB_2}@signer-2:30303\"]" > /app/datadir/static-nodes.json
# fi
sleep 3;

ipaddress=$(hostname -i)

# geth --bootnodes "enode://${ENODEPUB_1}@signer-1:30303,enode://${ENODEPUB_2}@signer-2:30303" --verbosity 3 --gcmode archive  --syncmode "full" --networkid="${NETWORK_CHAIN_ID}" --datadir=/app/datadir --http --http.addr="0.0.0.0" --http.port="8545" --http.corsdomain="*" --http.vhosts="*" --http.api="eth,net,web3" --allow-insecure-unlock dumpconfig > config.toml

# geth --bootnodes "enode://${ENODEPUB_1}@signer-1:30303,enode://${ENODEPUB_2}@signer-2:30303" --verbosity 3 --gcmode archive  --syncmode "full" --networkid="${NETWORK_CHAIN_ID}" --datadir=/app/datadir --http --http.addr="0.0.0.0" --http.port="8545" --http.corsdomain="*" --http.vhosts="*" --http.api="eth,net,web3" --allow-insecure-unlock --miner.etherbase=$SIGNERADD --mine --miner.gasprice 1 --unlock $SIGNERADD --password <(echo $SIGNERPW) -nodekey <(echo ${SIGNERKEY:?NOT SET})  --identity "Morpher Dev Demo Network"
geth --config /app/config.toml --verbosity 3 --miner.etherbase=$SIGNERADD --mine --miner.gasprice 1 --unlock $SIGNERADD --password <(echo $SIGNERPW) -nodekey <(echo ${SIGNERKEY:?NOT SET})  --identity "Morpher Dev Demo Network"
