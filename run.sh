#!/usr/bin/env bash
##################
### LOCALE FIX ###
##################
export LC_ALL="en_US.UTF-8"
#apt-get install language-pack-ru

sudo cat >/etc/default/locale <<EOL
LANG="en_US.UTF-8"
LANGUAGE="en_EN:en"
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE=en_US.UTF-8
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES=en_US.UTF-8
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL="en_US.UTF-8"
EOL

###sudo update-locale LANG=ru_RU.UTF-8

##################################
### NGINX  						###
##################################
sudo apt-get update -y
sudo apt-get install nginx -y
sudo service nginx stop

sudo cat >/etc/nginx/.htpasswd <<EOL
tester:\$apr1\$keuCCNr4\$Z52j1u9fL1lCnGcG29ZJl.
EOL

sudo chmod 644 /etc/nginx/.htpasswd

sudo cp /etc/nginx/nginx.conf /etc/nginx/nginxOld.conf
sudo rm -rf /etc/nginx/nginx.conf
sudo wget -O /etc/nginx/nginx.conf https://raw.githubusercontent.com/pashakopot/ubuntu-dev-env/master/nginx.conf

cd /
sudo mkdir webroot
sudo chmod 777 webroot


###############
### MONGODB ###
###############

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl enable mongod.service
sudo service mongod start

###############
### PHP-FPM ###
###############
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php7.1-fpm php7.1-mongodb php7.1-zip php7.1-xml php7.1-mbstring php7.1-curl php7.1-mcrypt php7.1-imap
rm /etc/php/7.1/fpm/conf.d/10-opcache.ini
sudo service php7.1-fpm restart

################
### COMPOSER ###
################

sudo apt-get install composer -y

###############
### LARAVEL ###
###############
sudo composer global require "laravel/installer"
cd /webroot
sudo ~/.composer/vendor/bin/laravel new laravel --force
sudo chown -R www-data:www-data laravel
sudo chmod -R 777 laravel
cd laravel
sudo chmod -R 777 storage
sudo chmod -R 777 bootstrap
cp .env.example .env
php artisan key:generate


sudo service nginx start

###########
### UFW ###
###########

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443
sudo ufw --force enable



#############
### REDIS ###
#############

# sudo apt-get update
# sudo apt-get install -y build-essential tcl
# cd /tmp
# sudo curl -O http://download.redis.io/redis-stable.tar.gz
# sudo tar xzvf redis-stable.tar.gz
# cd redis-stable
# sudo make
# sudo make test
# sudo make install
# sudo mkdir /etc/redis
# sudo wget -O /etc/redis/redis.conf https://raw.githubusercontent.com/pashakopot/ubuntu-dev-env/master/redis.conf

# sudo cat> /etc/systemd/system/redis.service <<EOL
# [Unit]
# Description=Redis In-Memory Data Store
# After=network.target

# [Service]
# User=redis
# Group=redis
# ExecStart=/usr/local/bin/redis-server /etc/redis/redis.conf
# ExecStop=/usr/local/bin/redis-cli shutdown
# Restart=always

# [Install]
# WantedBy=multi-user.target
# EOL

# sudo adduser --system --group --no-create-home redis
# sudo mkdir /var/lib/redis
# sudo chown redis:redis /var/lib/redis
# sudo chmod 770 /var/lib/redis

# sudo systemctl start redis
# sudo systemctl enable redis


####################
### NODEJS & NPM ###
####################

# sudo apt-get update
# sudo apt-get install -y nodejs
# sudo apt-get install -y npm

# sudo apt-get install htop

######################
### СЖАТИЕ ШАКАЛОВ ###
######################

sudo apt-get update -y
sudo apt-get install imagemagick -y

sudo apt-get update -y
sudo apt-get install libjpeg-turbo-progs -y



exit;
