FROM ethereum/client-go:alltools-latest

WORKDIR /app

COPY ./config/genesis.json /app/genesis.json


COPY ./config/miner-start.sh /app
RUN chmod u+x /app/miner-start.sh
RUN adduser -D -g '' geth

RUN chown geth:geth /app/miner-start.sh
RUN mkdir /app/datadir
RUN chown -R geth:geth /app
USER geth


CMD /app/miner-start.sh