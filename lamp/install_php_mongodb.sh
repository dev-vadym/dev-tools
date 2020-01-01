#!/bin/sh

sudo apt install -y php7.2-mongodb
sudo pecl install mongodb
sudo bash
sudo echo "extension=mongodb.so" >> /etc/php/7.2/fpm/php.ini
sudo echo "extension=mongodb.so" >> /etc/php/7.2/cli/php.ini
sudo systemctl restart php7.2-fpm.service