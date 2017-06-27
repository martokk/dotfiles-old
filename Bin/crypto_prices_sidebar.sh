#!/usr/bin/env bash

##################### POTCOIN #####################
pot_usd=`curl -s https://api.coinmarketcap.com/v1/ticker/potcoin/ | jq '.[0].price_usd' | tr -d '"'`
pot_usd=`bc -l <<< "scale=2; $pot_usd/1"`

pot_btc=`curl -s https://api.coinmarketcap.com/v1/ticker/potcoin/ | jq '.[0].price_btc' | tr -d '"'`
pot_mbtc=`bc -l <<< "scale=3; $pot_btc*1000/1"`


##################### SIACOIN #####################
sc_usd=`curl -s https://api.coinmarketcap.com/v1/ticker/siacoin/ | jq '.[0].price_usd' | tr -d '"'`
sc_usd=`bc -l <<< "scale=3; $sc_usd/1"`

sc_btc=`curl -s https://api.coinmarketcap.com/v1/ticker/siacoin/ | jq '.[0].price_btc' | tr -d '"'`
sc_mbtc=`bc -l <<< "scale=4; $sc_btc*1000/1"`


##################### STRATIS #####################
strat_usd=`curl -s https://api.coinmarketcap.com/v1/ticker/stratis/ | jq '.[0].price_usd' | tr -d '"'`
strat_usd=`bc -l <<< "scale=2; $strat_usd/1"`

strat_btc=`curl -s https://api.coinmarketcap.com/v1/ticker/stratis/ | jq '.[0].price_btc' | tr -d '"'`
strat_mbtc=`bc -l <<< "scale=2; $strat_btc*1000/1"`


##################### SUMMARY #####################
echo "POT  :  $"0$pot_usd"   |  0"$pot_mbtc"m฿"
echo "SC   :  $"0$sc_usd"  |  0"$sc_mbtc"m฿"
echo "STRAT:  $"$strat_usd"   |  "$strat_mbtc"m฿"
