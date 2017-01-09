#!/bin/bash

cat > selecttablequery.hql <<EOF
SELECT * FROM base_table where dt='$1';
EOF
hive -f selecttablequery.hql;
rm -rf selecttablequery.hql;