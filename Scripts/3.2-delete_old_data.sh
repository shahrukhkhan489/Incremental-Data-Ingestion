#!/bin/bash

delete_date=`date +%F --date="$1 day ago"`;
hadoop fs -rmr /apps/hive/warehouse/base_table/dt=$delete_date

