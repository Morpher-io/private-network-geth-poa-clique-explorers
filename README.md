# Full Private Network (POA) with Geth-Clique

This Repostory contains:

1. Bootnode
2. 2 Signers with Clique
3. 2 Clients with WS/HTTP open
4. Blockscout with Adaptations
5. Light-Explorer
6. Ethstats-Dashboard

![](./private-network-quickstart.png)

## Quickstart

You need to have Docker installed. Then you can simply do:

```
docker-compose up
```

## Why?

Development with Geth/POA is still pretty hard. There are a few tools out there to help, but nothing is really turn-key. And if, they rely on patterns that are simply not preferrable.

1. This docker-compose file boots up a bootnode.
2. Then two signers are connecting through _DNS_. **No static IPs**
3. Then two clients are connecting as well.
4. After the system is started, the explorers are attaching to the nodes

Everything works through __environment variables__. So, if you need to deploy geth to AWS for your private network, then the bulk of work is done here.

## From Development to Production

Change the values in the .env file and potentially adapt the values in docker-compose.yml

## Services

All services are reachable through portforwarding to localhost:

Client 1:
-> http://localhost:8545
-> ws://localhost:8546

Client 2:
-> http://localhost:8547
-> ws://localhost:8548

Explorer starts on [http://localhost:8080](http://localhost:8080)

AlethIO Lite Explorer starts on [http://localhost:8081](http://localhost:8081)

Blockscout starts on [http://localhost:8082](http://localhost:8082)

Ethstats Dashboard starts on [http://localhost:8083](http://localhost:8083)

## License

The MIT License

Copyright (c) 2022 Morpher

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE