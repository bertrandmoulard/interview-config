#!/bin/bash

CURRENT_DIR=`pwd`
sudo cat 000-default.conf > /etc/apache2/sites-available/000-default.conf

mysql -uroot -e "CREATE USER 'cooking'@'localhost' IDENTIFIED BY 'cooking';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'cooking'@'localhost' WITH GRANT OPTION"

git clone https://github.com/bertrandmoulard/cooking.git /var/www/
cd cooking
cat config.ini > /var/www/cooking/config.ini
cd /var/www/cooking
wget https://getcomposer.org/composer.phar
php composer.phar install
sudo service nginx stop
sudo service apache restart
