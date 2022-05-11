FROM node:16-alpine as builder

RUN apk add git

WORKDIR /opt/ethstats
RUN git clone https://github.com/tomw1808/ethstats-server . && npm install
RUN npm install -g grunt-cli

RUN grunt poa

CMD npm start