rq=`date +%Y%m%d`

mysqldump -hmysql1008.ixwebhosting.com -uC321871_backup -p1qaz\!QAZ C321871_number1g_zt > /media/data/sqlbackup/number1g_zt.$rq.sql
mysqldump -hmysql1008.ixwebhosting.com -uC321871_backup -p1qaz\!QAZ C321871_khnblog > /media/data/sqlbackup/khnblog.$rq.sql
#mysqldump -hmysql1008.ixwebhosting.com -uC321871_backup -p1qaz\!QAZ C321871_number1g > /media/data/sqlbackup/number1g.$rq.sql
