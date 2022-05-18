#!/usr/bin/env bash
sudo apt-get update
sudo apt-get -y install nginx
sudo touch index.html /var/www/html/
echo 'dummy text' > /var/www/html/index.html
sudo mkdir /var/www/error
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/
#sudo chown $USER:$USER /data/web_static/releases/test/
echo "dummy text" > /data/web_static/releases/test/index.html
echo "Ceci n'est pas une page" > /var/www/error/404.html
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo sed -i "/^\tlocation \/ {$/ i\\\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t\tautoindex off;\n}" /etc/nginx/sites-available/default
sudo service nginx restart
sudo chown -R ubuntu:ubuntu /data/