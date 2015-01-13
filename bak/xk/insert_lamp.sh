yum -y install gcc make wget gd libpng curl freetype zlib libjpeg  bison gcc gcc-c++ autoconf automake zlib* libxml* ncurses-devel libtool-ltdl-devel* bzip2* libcurl-devel libcurl libjpeg-devel libpng-devel gd-devel vim ImageMagick.x86_64 ImageMagick-devel.x86_64 libjpeg.x86_64 libjpeg-devel.x86_64 subversion libevent-devel libevent
cd /usr/local/src/
wget http://mirror.bjtu.edu.cn/apache//httpd/httpd-2.2.23.tar.gz
tar -zxvf httpd-2.2.23.tar.gz
cd httpd-2.2.23
./configure --prefix=/usr/local/httpd  --enable-so --enable-rewrite
make && make install
cd /usr/local/src/
wget http://stderr.net/apache/rpaf/download/mod_rpaf-0.6.tar.gz
tar -zxvf mod_rpaf-0.6.tar.gz 
cd mod_rpaf-0.6
/usr/local/httpd/bin/apxs -i -c -n mod_rpaf-2.0.so mod_rpaf-2.0.c
iptables -I INPUT -p tcp --dport 80 -j ACCEPT
cd ..
wget http://cn2.php.net/get/php-5.3.17.tar.gz/from/this/mirror
wget ftp://mcrypt.hellug.gr/pub/crypto/mcrypt/libmcrypt/libmcrypt-2.5.7.tar.gz
tar -zxvf libmcrypt-2.5.7.tar.gz
cd libmcrypt-2.5.7
./configure --prefix=/usr/local/libmcrypt  --disable-posix-threads
make && make install
cd ..
tar -zxvf php-5.3.17.tar.gz
cd php-5.3.17
./configure --prefix=/usr/local/php --with-apxs2=/usr/local/httpd/bin/apxs --with-config-file-path=/usr/local/php/etc --with-mysql=mysqlnd --with-gd --with-png-dir --with-curl --with-bz2 --with-freetype-dir --with-iconv-dir --with-zlib-dir --enable-soap --with-pear=PREFIX/pear --enable-gd-native-ttf --enable-mbstring --enable-exif --disable-cgi --enable-cli --with-jpeg-dir --enable-bcmath --enable-sockets --disable-ipv6  --with-mcrypt=/usr/local/libmcrypt  --with-pdo-mysql=mysqlnd --with-mysqli=mysqlnd
make
make install

cd /usr/local/httpd/htdocs/
cd /usr/local/src/
wget https://nodeload.github.com/nicolasff/phpredis/tarball/master
mv master phpredis-2.2.2-51-g3a3ee37.tar.gz
tar -zxvf phpredis-2.2.2-51-g3a3ee37.tar.gz
cd nicolasff-phpredis-3a3ee37/
/usr/local/php/bin/phpize
./configure  --with-php-config=/usr/local/php/bin/php-config
make && make install

cd /usr/local/src/
wget http://pecl.php.net/get/memcache-2.2.7.tgz
tar -zxvf memcache-2.2.7.tgz
cd memcache-2.2.7
/usr/local/php/bin/phpize
./configure  --with-php-config=/usr/local/php/bin/php-config
make && make install

cd /usr/local/src/
wget http://pecl.php.net/get/qqwry-0.1.0.tgz
tar -zxvf qqwry-0.1.0.tgz
cd qqwry-0.1.0
/usr/local/php/bin/phpize &&  ./configure --with-php-config=/usr/local/php/bin/php-config  && make && make install

cd ..
wget http://pecl.php.net/get/mongo-1.2.12.tgz
tar -zxvf mongo-1.2.12.tgz
cd mongo-1.2.12
/usr/local/php/bin/phpize &&  ./configure --with-php-config=/usr/local/php/bin/php-config  && make && make install

cd /usr/local/src
wget http://pecl.php.net/get/imagick-3.0.1.tgz
tar -zxvf http://pecl.php.net/get/imagick-3.0.1.tgz
tar -zxvf imagick-3.0.1.tgz
cd imagick-3.0.1
/usr/local/php/bin/phpize && ./configure --with-php-config=/usr/local/php/bin/php-config && make && make install

scp root@10.10.252.186:/usr/local/php/etc/php.ini /usr/local/php/etc/
scp root@10.10.252.186:/usr/local/httpd/conf/httpd.conf /usr/local/httpd/conf/
cd /usr/local/httpd/htdocs/ 
svn co svn://10.10.252.200/xikang_web/trunk/ ./ 
scp root@10.10.252.186:/usr/local/httpd/htdocs/system/application/config/difference/10.10.252.186.conf.php /usr/local/httpd/htdocs/system/application/config/difference/ 
mkdir /usr/local/httpd/htdocs/system/cache 
chmod -R 777 /usr/local/httpd/htdocs/system/cache/
chmod -R 777 system/logs/
scp root@10.10.252.186:/usr/local/httpd/htdocs/system/application/config/difference/10.10.252.186.conf.php /usr/local/httpd/htdocs/system/application/config/difference/ 
/usr/local/httpd/bin/apachectl start
