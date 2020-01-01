# LAMP php, MySQL, Nginx ...
Документация и скрипты для установки php, MySQL, Nginx и т.д.

- [Установка NGINX](#Установка-NGINX)
- [Установка PHP-FPM](#Установка-PHP-FPM)
- [Установка MongoDB](#Установка-MongoDB)
- [Установка MariaDB](#Установка-MariaDB)
- [Установка Percona server](#Установка-Percona-server)
- [Установка Redis](#Установка-Redis)
- [Создание пользователя в MySQL базе, и установка полных прав](#Создание-пользователя-в-MySQL-базе,-и-установка-полных-прав)
- [Создание виртуального хоста Nginx](#Создание-виртуального-хоста-Nginx)

## Установка NGINX
*[install_nginx.sh](install_nginx.sh) - скрипт установки*
```
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:nginx/stable
sudo apt-get update
sudo apt-get install -y nginx
```

## Установка PHP-FPM
*[install_php.sh](install_php.sh) - скрипт установки*
```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php7.2-cli php7.2-fpm php7.2-curl php7.2-gd php7.2-mysql php7.2-mbstring php7.2-json php7.2-common php7.2-opcache php7.2-dev zip unzip php7.2-redis php7.2-xml php-pear
```

##### Установка расширения MongoDB для php
*[install_php_mongodb.sh](install_php_mongodb.sh) - скрипт установки*
```
sudo apt install php7.2-mongodb
sudo pecl install mongodb
sudo bash
sudo echo "extension=mongodb.so" >> /etc/php/7.2/fpm/php.ini
sudo echo "extension=mongodb.so" >> /etc/php/7.2/cli/php.ini
sudo systemctl restart php7.2-fpm.service
```

## Установка MongoDB
```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E52529D4
```
##### Для ubuntu 18.04
*[install_mongodb.sh](install_mongodb.sh) - скрипт установки*
```
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt update
sudo apt install -y mongodb-org mongodb-org-server
```

##### Для ubuntu 16.04
*[install_mongodb_1604.sh](install_mongodb_1604.sh) - скрипт установки*
```
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-4.0.list'
sudo apt update
sudo apt install -y mongodb-org mongodb-org-server
```

## Установка MariaDB
*[install_mariadb.sh](install_mariadb.sh) - скрипт установки*
```
sudo apt-get install -y software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror.mephi.ru/mariadb/repo/10.3/ubuntu bionic main'
sudo apt install -y mariadb-server mariadb-client
```

## Установка Percona server
```
wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb
sudo dpkg -i percona-release_latest.$(lsb_release -sc)_all.deb
sudo percona-release setup ps80
sudo apt-get install -y percona-server-server
```

## Установка Redis
```
sudo apt-get install -y redis-server
```

## Создание пользователя в MySQL базе, и установка полных прав
```
CREATE USER 'dev'@'%' IDENTIFIED BY '1111';
GRANT ALL PRIVILEGES ON *.* TO 'dev'@'%';
FLUSH PRIVILEGES;
```

## Создание виртуального хоста Nginx
```
mkdir /var/www/testsite.com
echo "Hello World" > /var/www/testsite.com/index.php
sudo chown -R $USER:$USER /var/www/testsite.com
chmod -R 755 /var/www
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/testsite.com.conf
ln -s /etc/nginx/sites-available/testsite.com.conf /etc/nginx/sites-enabled/testsite.com.conf
service nginx restart
```