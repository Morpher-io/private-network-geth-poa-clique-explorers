FROM ethereum/client-go:alltools-latest

WORKDIR /app

COPY ./bootnode-start.sh /app
RUN chmod u+x /app/bootnode-start.sh
RUN adduser -D -g '' geth

RUN chown geth:geth /app/bootnode-start.sh
USER geth

EXPOSE 30301/udp
EXPOSE 30303/udp

CMD /app/bootnode-start.sh

# CMD bootnode -nodekeyhex ${NODEKEYHEX:?NOT SET}