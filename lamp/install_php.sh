#!/bin/sh

sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php7.2-cli php7.2-fpm php7.2-curl php7.2-gd php7.2-mysql php7.2-mbstring php7.2-json php7.2-common php7.2-opcache php7.2-dev zip unzip php7.2-redis php7.2-xml