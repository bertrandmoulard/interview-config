#!/bin/bash

CURRENT_DIR=`pwd`
sudo cp 000-default.conf /etc/apache2/sites-available/
sudo ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/

mysql -uroot -e "CREATE USER 'cooking'@'localhost' IDENTIFIED BY 'cooking';"
mysql -uroot -e "CREATE DATABASE cooking"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'cooking'@'localhost' WITH GRANT OPTION"

cd /vagrant
git clone https://github.com/bertrandmoulard/cooking.git
cat $CURRENT_DIR/config.ini > /vagrant/cooking/config.ini
cd /vagrant/cooking
ln -s /vagrant/cooking /var/www/
wget https://getcomposer.org/composer.phar
php composer.phar install
cd db
mysql -ucooking -pcooking cooking < schema.sql
php sample_data.php
sudo service nginx stop
sudo service apache2 restart
