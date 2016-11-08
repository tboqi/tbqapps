cd /root/
nohup ./ydyNetProxy -port=8213 -https=false -jsonv=true -htmlv=false > 8213.out &      
#nohup ./ydyNetProxy -port=8313 -https=false -jsonv=true -htmlv=false > 8313.out &
#nohup ./ydyNetProxy -port=8413 -https=false -jsonv=true -htmlv=true  > 8413.out &
/home/work/lib/nginx/sbin/nginx
/home/work/lib/php5.6.7/sbin/php-fpm
#cp /home/work/wwwroot/tbqcfg/hosts160329 /etc/hosts
