#!/usr/bin/env bash

source ~/.bash_profile

cd $STOCKS_HOME/data/etl/trading
python3 ./collect_trade_daily.py
echo "finished collect_trade_daily"
