#!/bin/bash

filename="output.tsv"
dt=`date +%F`;
directory="/user/hive-ingest-users/data";

wget -O webpage.html https://data.medicare.gov/browse/embed?category=Home+Health+Compare
snapshot_version=`sed -n 's/.*href="\([^"]*\).*/\1/p' webpage.html | grep  Home-Health-Care-Agencies | sort | uniq | cut -d'/' -f 6-`
rm -rf webpage.html;

wget -O $filename https://data.medicare.gov/api/views/$snapshot_version/rows.tsv?accessType=DOWNLOAD;



sed -i "s/\$/\t$dt/g" $filename;
sed -i 1d $filename;

hadoop fs -rmr $directory;
hadoop fs -mkdir $directory;
hadoop fs -moveFromLocal $filename $directory/;