FROM ethereum/client-go:alltools-latest

WORKDIR /app

COPY ./config/config.toml /app/config.toml
COPY ./config/genesis.json /app/genesis.json


COPY ./config/migrate-keys.sh /app
RUN chmod u+x /app/migrate-keys.sh
RUN adduser -D -g '' geth

RUN chown geth:geth /app/migrate-keys.sh
RUN mkdir /app/datadir
RUN chown -R geth:geth /app
USER geth


CMD /app/migrate-keys.sh