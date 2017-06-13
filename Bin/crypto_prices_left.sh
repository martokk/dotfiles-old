#!/usr/bin/env bash

##################### BITCOIN #####################
btc_usd=`curl -s https://api.coinmarketcap.com/v1/ticker/bitcoin/ | jq '.[0].price_usd' | tr -d '"'`
btc_usd=`bc -l <<< "scale=0; $btc_usd/1"`


##################### ETHEREUM #####################
eth_usd=`curl -s https://api.coinmarketcap.com/v1/ticker/ethereum/ | jq '.[0].price_usd' | tr -d '"'`
eth_usd=`bc -l <<< "scale=0; $eth_usd/1"`

eth_btc=`curl -s https://api.coinmarketcap.com/v1/ticker/ethereum/ | jq '.[0].price_btc' | tr -d '"'`
eth_mbtc=`bc -l <<< "scale=1; $eth_btc*1000/1"`





##################### SUMMARY #####################
echo "BTC: $"$btc_usd"    ||    ETH: $"$eth_usd" / "$eth_mbtc"m฿"
