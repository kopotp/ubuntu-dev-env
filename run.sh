##################################
### NGINX + NGXPAGESPEED + SSL ###
##################################
sudo apt-get install libssl-dev

bash <(curl -f -L -sS https://ngxpagespeed.com/install) \
     --nginx-version latest -y -a '--with-http_ssl_module --with-http_gzip_static_module --with-http_gunzip_module --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --with-stream --with-stream_ssl_module --with-mail --with-mail_ssl_module --with-threads --without-http_browser_module --without-http_geo_module --without-http_limit_req_module --without-http_referer_module --without-http_scgi_module --without-http_split_clients_module --without-http_ssi_module --without-http_userid_module --without-http_uwsgi_module'

cp ~/nginx-1.12.0/objs/nginx /usr/sbin/nginx


cat >/lib/systemd/system/nginx.service <<EOL
[Unit]
Description=The NGINX HTTP and reverse proxy server
After=syslog.target network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
PIDFile=/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t
ExecStart=/usr/sbin/nginx
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOL

sudo apt-get update

wget -O /usr/local/nginx/conf/nginx.conf https://raw.githubusercontent.com/pashakopot/DO-ubuntu.16.04.nginx.mongo.php71.pagespeed.redis/master/nginx.conf

cd /
mkdir webroot
sudo chmod 777 webroot
cd /webroot
mkdir www
chown -R www-data:www-data www

cat >/webroot/www/index.php <<EOL
<?php
    phpinfo();
EOL

sudo service nginx start

###########
### UFW ###
###########

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable

###############
### MONGODB ###
###############

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start

###############
### PHP-FPM ###
###############
sudo apt-get install php-fpm php-mongodb

#############
### REDIS ###
#############
sudo apt-get update
sudo apt-get install build-essential tcl
cd /tmp
curl -O http://download.redis.io/redis-stable.tar.gz
tar xzvf redis-stable.tar.gz
cd redis-stable
make
make test
sudo make install
sudo mkdir /etc/redis
sudo cp /tmp/redis-stable/redis.conf /etc/redis



########## sudo nano /etc/redis/redis.conf
cat> /etc/systemd/system/redis.service <<EOL
[Unit]
Description=Redis In-Memory Data Store
After=network.target

[Service]
User=redis
Group=redis
ExecStart=/usr/local/bin/redis-server /etc/redis/redis.conf
ExecStop=/usr/local/bin/redis-cli shutdown
Restart=always

[Install]
WantedBy=multi-user.target
EOL


exit;



