apt-get update
add-apt-repository ppa:ondrej/php -y
apt-get update
apt-get  install -y php7.2 php7.2-cli php7.2-fpm php7.2-common php7.2-curl php7.2-gd php7.2-xml php7.2-mbstring php7.2-mysql -y
apt-get  install php7.2 libapache2-mod-php7.2 php7.2-common php7.2-sqlite php7.2-curl php7.2-intl php7.2-mbstring php7.2-xmlrpc php7.2-mysql php7.2-gd php7.2-xml php7.2-cli php7.2-zip -y
apt-get install unzip -y

cat << EOF  > /etc/php/7.2/apache2/php.ini
file_uploads = On
allow_url_fopen = On
short_open_tag = On
memory_limit = 256M
upload_max_filesize = 100M
max_execution_time = 360
date.timezone = Asia/Manila
EOF


cd /var/www && rm -rf html/ && wget    https://github.com/sharmasudhanshu/configs/blob/master/mypiwik.tar?raw=true -O piwik.tar
tar -xvf   piwik.tar
rm -rf piwik.tar

chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
systemctl enable   apache2
systemctl restart apache2.service

