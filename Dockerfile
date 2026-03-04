FROM ethereum/client-go:stable

COPY genesis.json /genesis.json

RUN mkdir /chain
RUN geth init /genesis.json --datadir /chain

CMD geth \
--datadir /chain \
--networkid 1859122391 \
--http \
--http.addr 0.0.0.0 \
--http.port 8545 \
--http.api eth,net,web3,personal,miner \
--mine \
--miner.threads 1 \
--allow-insecure-unlock
