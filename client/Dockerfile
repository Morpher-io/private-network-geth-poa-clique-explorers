FROM ethereum/client-go:alltools-latest

WORKDIR /app

COPY ./config/genesis.json /app/genesis.json


COPY ./config/client-start.sh /app
RUN chmod u+x /app/client-start.sh
RUN adduser -D -g '' geth

RUN chown geth:geth /app/client-start.sh
RUN mkdir /app/datadir
RUN chown -R geth:geth /app
USER geth

EXPOSE 8545
EXPOSE 8546

CMD /app/client-start.sh

# CMD bootnode -nodekeyhex ${NODEKEYHEX:?NOT SET}