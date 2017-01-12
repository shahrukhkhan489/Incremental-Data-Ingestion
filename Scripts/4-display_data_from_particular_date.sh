#!/bin/bash

cat > ~/selecttablequery.hql <<EOF
SELECT count(*) FROM base_table where dt='$1';
EOF
echo "No of Records during $1" > ~/logs/$1-queryoutput.log;
hive -f ~/selecttablequery.hql >> ~/logs/$1-queryoutput.log;

echo "

"  >> ~/logs/$1-queryoutput.log;

cat > ~/selecttablequery.hql <<EOF
SELECT * FROM base_table where dt='$1';
EOF
hive -f ~/selecttablequery.hql >> ~/logs/$1-queryoutput.log;

rm -rf ~/selecttablequery.hql;
