FROM ethereum/client-go:alltools-latest

WORKDIR /app


COPY ./config/config.toml /app/config.toml
COPY ./config/genesis.json /app/genesis.json


COPY ./config/miner-start.sh /app
RUN chmod u+x /app/miner-start.sh
# RUN adduser -D -g '' ec2-user

# RUN chown ec2-user:ec2-user /app/miner-start.sh
RUN mkdir /app/datadir
# RUN chown -R ec2-user:ec2-user /app
# USER ec2-user


CMD /app/miner-start.sh