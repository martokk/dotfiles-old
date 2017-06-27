#!/usr/bin/env bash

##################### BITCOIN #####################
btc_usd=`curl -s https://api.coinmarketcap.com/v1/ticker/bitcoin/ | jq '.[0].price_usd' | tr -d '"'`
btc_usd=`bc -l <<< "scale=0; $btc_usd/1"`


##################### ETHEREUM #####################
eth_usd=`curl -s https://api.coinmarketcap.com/v1/ticker/ethereum/ | jq '.[0].price_usd' | tr -d '"'`
eth_usd=`bc -l <<< "scale=0; $eth_usd/1"`

eth_btc=`curl -s https://api.coinmarketcap.com/v1/ticker/ethereum/ | jq '.[0].price_btc' | tr -d '"'`
eth_mbtc=`bc -l <<< "scale=1; $eth_btc*1000/1"`


##################### RIPPLE #####################
xrp_usd=`curl -s https://api.coinmarketcap.com/v1/ticker/ripple/ | jq '.[0].price_usd' | tr -d '"'`
xrp_usd=`bc -l <<< "scale=2; $xrp_usd/1"`

xrp_btc=`curl -s https://api.coinmarketcap.com/v1/ticker/ripple/ | jq '.[0].price_btc' | tr -d '"'`
xrp_mbtc=`bc -l <<< "scale=3; $xrp_btc*1000/1"`


##################### STEEM #####################
steem_usd=`curl -s https://api.coinmarketcap.com/v1/ticker/steem/ | jq '.[0].price_usd' | tr -d '"'`
steem_usd=`bc -l <<< "scale=2; $steem_usd/1"`

steem_btc=`curl -s https://api.coinmarketcap.com/v1/ticker/steem/ | jq '.[0].price_btc' | tr -d '"'`
steem_mbtc=`bc -l <<< "scale=3; $steem_btc*1000/1"`



##################### SUMMARY #####################
echo "BTC: $"$btc_usd"    |    ETH: $"$eth_usd" / "$eth_mbtc"m฿    |    XRP: $"0$xrp_usd" / 0"$xrp_mbtc"m฿    |    STEEM: $"$steem_usd" / 0"$steem_mbtc"m฿"
