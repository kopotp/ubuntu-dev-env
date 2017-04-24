# Ubuntu Dev Env

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
sudo passwd root
su root

bash <(curl -f -L -sS https://raw.githubusercontent.com/pashakopot/ubuntu-dev-env/master/run.sh)
```

## Additional config (Optional)

```
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

sudo swapon -s
```

Rsync command

```
rsync -crvzpP -e 'ssh -i ~/.ssh/id_rsa' --links --delete --exclude '.git' --exclude 'public/img/uploads' --exclude 'helpers/cache' --exclude 'storage/logs' --exclude 'frontend/node_modules' --exclude 'fa/node_modules' ~/Desktop/projects/autoo.ru/web/ root@178.62.122.239:/webroot/laravel
```