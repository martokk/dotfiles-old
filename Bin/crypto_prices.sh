#!/usr/bin/env bash

btc_usd=`curl -s https://api.coinmarketcap.com/v1/ticker/bitcoin/ | jq '.[0].price_usd' | tr -d '"'`
btc_usd=`bc -l <<< "scale=0; $btc_usd/1"`

steem_btc=`curl -s https://api.coinmarketcap.com/v1/ticker/steem/ | jq '.[0].price_btc' | tr -d '"'`
steem_mbtc=`bc -l <<< "scale=3; $steem_btc*1000/1"`

echo "BTC: $"$btc_usd"   STEEM: 0"$steem_mbtc"m฿"   
