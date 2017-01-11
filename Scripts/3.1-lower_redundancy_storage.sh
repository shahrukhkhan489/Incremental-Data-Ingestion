#!/bin/bash

redundant_date=`date +%F --date="$1 day ago"`;
hadoop fs -setrep -R -w 1 /apps/hive/warehouse/base_table/dt=$redundant_date

