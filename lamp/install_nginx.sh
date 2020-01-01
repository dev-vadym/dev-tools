#!/bin/sh

sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:nginx/stable
sudo apt-get update
sudo apt-get install -y nginx
