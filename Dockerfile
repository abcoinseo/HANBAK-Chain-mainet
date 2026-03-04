FROM ethereum/client-go:stable

WORKDIR /app

COPY genesis.json /app/genesis.json

RUN mkdir -p /chain

RUN geth --datadir /chain init /app/genesis.json

EXPOSE 10000

CMD geth \
--datadir /chain \
--networkid 1859122391 \
--http \
--http.addr 0.0.0.0 \
--http.port 10000 \
--http.api eth,net,web3,personal,miner \
--syncmode full \
--allow-insecure-unlock \
--mine \
--miner.threads 1
