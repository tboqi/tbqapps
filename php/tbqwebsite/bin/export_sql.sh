#! /bin/bash -

cd ../docs/sql/
mysqldump -hlocalhost -uroot -p111111 khnapps_website | gzip > khnapps_website.`date +%Y%m%d`.sql.gz
cd -
