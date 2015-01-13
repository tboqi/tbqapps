rq=`date +%Y%m%d`
mkdir /root/mongoBackup/$rq
/opt/mongodb/bin/mongodump -d xikang -o /root/mongoBackup/$rq/
