#!/usr/bin/env bash
source ~/.bash_profile

echo -e "###### report_select start @ `date` \n"
python3 $STOCKS_HOME/app/report/report_select.py
echo -e "###### report_select end @ `date` \n"

