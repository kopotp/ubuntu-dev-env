# Ubuntu Dev Env

## Description

- Nginx
- PHP7.1-fpm + MongoDB Extension
- MongoDB
- Redis (from source)
- Ufw for 22, 80, 443
- NodeJS
- NPM
- Composer
- Laravel
- Image libs

## Installation
Run this on fresh Digital Ocean Ubuntu 16.04.2 Droplet
```
bash <(curl -f -L -sS https://raw.githubusercontent.com/pashakopot/ubuntu-dev-env/master/run.sh)
```

## Additional config (Optional)

todo : перенести в init.sh и дописать сохранение после перезагрузки https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04
```
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

sudo swapon -s
free -m

sudo nano /etc/fstab
```

At the bottom of the file, you need to add a line that will tell the operating system to automatically use the file you created:

```
/swapfile   none    swap    sw    0   0
```
