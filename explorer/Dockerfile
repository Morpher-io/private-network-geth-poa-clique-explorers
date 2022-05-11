FROM node:16-alpine

WORKDIR "/app"

RUN apk add git && \
    git clone https://bitbucket.org/tomw1808/blockchain-explorer.git

WORKDIR "/app/blockchain-explorer"

RUN npm install
EXPOSE 8080

CMD npm run start

