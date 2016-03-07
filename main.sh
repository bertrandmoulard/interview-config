#!/bin/bash

CURRENT_DIR=`pwd`
sudo cp 000-default.conf /etc/apache2/sites-available/
sudo ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/

mysql -uroot -e "CREATE USER 'cooking'@'localhost' IDENTIFIED BY 'cooking';"
mysql -uroot -e "CREATE DATABASE cooking"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'cooking'@'localhost' WITH GRANT OPTION"

cd /var/www/
git clone https://github.com/bertrandmoulard/cooking.git
cat $CURRENT_DIR/config.ini > /var/www/cooking/config.ini
cd /var/www/cooking
wget https://getcomposer.org/composer.phar
php composer.phar install
cd db
mysql -ucooking -pcooking cooking < schema.sql
sudo service nginx stop
sudo service apache2 restart
