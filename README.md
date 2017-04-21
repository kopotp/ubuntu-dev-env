# Digital Ocean Ubuntu 16.04.2 Dev Enviroment

## Description

- Nginx + SSL + NGX-PageSpeed (from source)
- PHP7.0-fpm + MongoDB Extension
- MongoDB
- Redis (from source)
- Ufw for 22, 80, 443
- NodeJS
- NPM
- Composer
- Laravel

## Installation
Run this on fresh Digital Ocean Ubuntu 16.04.2 Droplet
```
#!bash
bash <(curl -f -L -sS https://raw.githubusercontent.com/pashakopot/DO-ubuntu.16.04.nginx.mongo.php71.pagespeed.redis/master/run.sh)
```