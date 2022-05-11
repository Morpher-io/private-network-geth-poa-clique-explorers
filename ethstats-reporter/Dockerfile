FROM node:16-alpine as builder

RUN apk add git

WORKDIR /opt/ethstats
RUN git clone https://github.com/tomw1808/ethstats-client . && npm install

## this image uses pm2 to manage several reporting-containers at once
## Pretty unnecessary overlay if you just run one single node, but we're running 4 and I did not want to do another 4 containers more
RUN npm install -g pm2
CMD pm2-runtime app.json