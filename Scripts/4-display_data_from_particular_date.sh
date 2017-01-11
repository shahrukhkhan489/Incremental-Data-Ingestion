#!/bin/bash

cat > ~/selecttablequery.hql <<EOF
SELECT * FROM base_table where dt='$1';
EOF
hive -f ~/selecttablequery.hql > ~/$1-queryoutput.log;
rm -rf ~/selecttablequery.hql;