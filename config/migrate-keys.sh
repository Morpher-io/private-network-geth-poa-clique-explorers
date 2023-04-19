#!/bin/sh

DIR="/app/datadir/geth"
# if [ ! -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "Installing config files in ${DIR}..."
  # sed -i 's/"chainId": 21000/"chainId": '$NETWORK_CHAIN_ID'/' /app/genesis.json
  # sed -i 's/"extraData": "0x00000000000000000000000000000000000000000000000000000000000000003c1ed3433916f130a7badf8b1ad770cfa2fd03bed96c84c682a298d964f517a61617a8be7cc67f04/"extraData": "0x0000000000000000000000000000000000000000000000000000000000000000'${SIGNERADD/"0x"/""}${SIGNER2ADD/"0x"/""}'/' /app/genesis.json
  # geth init --datadir=/app/datadir /app/genesis.json 
  # cat /app/genesis.json

  echo ${SIGNER1KEY} > /app/key1
  geth account import --datadir=/app/datadir --password <(echo $SIGNER1PW) /app/key1
  rm /app/key1
  echo ${SIGNER2KEY} > /app/key2
  geth account import --datadir=/app/datadir --password <(echo $SIGNER2PW) /app/key2
  rm /app/key2
  echo ${SIGNER3KEY} > /app/key3
  geth account import --datadir=/app/datadir --password <(echo $SIGNER3PW) /app/key3
  rm /app/key3
  echo ${SIGNER4KEY} > /app/key4
  geth account import --datadir=/app/datadir --password <(echo $SIGNER4PW) /app/key4
  rm /app/key4

# fi
sleep 3;

ipaddress=$(hostname -i)


echo $SIGNER1PW > password.txt
echo $SIGNER2PW >> password.txt
echo $SIGNER3PW >> password.txt
echo $SIGNER4PW >> password.txt

echo "$SIGNER1ADD,$SIGNER2ADD,$SIGNER3ADD,$SIGNER4ADD";

geth --verbosity 3 --gcmode archive  --syncmode "full" --networkid="${NETWORK_CHAIN_ID}" --datadir=/app/datadir --unlock "$SIGNER1ADD,$SIGNER2ADD,$SIGNER3ADD,$SIGNER4ADD" --password "password.txt" --identity "Morpher Dev Demo Network"
