#!/usr/bin/env bash

btc_usd=`curl -s https://api.coinmarketcap.com/v1/ticker/bitcoin/ | jq '.[0].price_usd' | tr -d '"'`
btc_usd=`bc -l <<< "scale=0; $btc_usd/1"`

eth_usd=`curl -s https://api.coinmarketcap.com/v1/ticker/ethereum/ | jq '.[0].price_usd' | tr -d '"'`
eth_usd=`bc -l <<< "scale=0; $eth_usd/1"`

eth_btc=`curl -s https://api.coinmarketcap.com/v1/ticker/ethereum/ | jq '.[0].price_btc' | tr -d '"'`
eth_mbtc=`bc -l <<< "scale=1; $eth_btc*1000/1"`

steem_btc=`curl -s https://api.coinmarketcap.com/v1/ticker/steem/ | jq '.[0].price_btc' | tr -d '"'`
steem_mbtc=`bc -l <<< "scale=3; $steem_btc*1000/1"`

echo "BTC: $"$btc_usd" | ETH: $"$eth_usd"     ||     ETH: "$eth_mbtc"m฿ | STEEM: 0"$steem_mbtc"m฿"
