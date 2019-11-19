#PHP SETUP
rm -rf /etc/php/7.3/fpm/php.ini
cp /tmp/php.ini /etc/php/7.3/fpm/php.ini

#SERVICE START
service php7.3-fpm start
service mysql start

#NGINX SETUP
mkdir -p /var/www/localhost
rm -rf /etc/nginx/sites-enabled/default
cp /tmp/nginx_config /etc/nginx/sites-available/nginx_config
ln -s /etc/nginx/sites-available/nginx_config /etc/nginx/sites-enabled/default
cp /tmp/index.php /var/www/localhost/index.php

#WORDPRESS SETUP
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpark'@'localhost' IDENTIFIED BY '1234'" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

#MYSQL SETUP ROOT PASSWORD
#echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';" | mysql -u root
#echo "FLUSH PRIVILEGES;" | mysql -u root

#WORDPRESS INSTALLATION
mkdir /var/www/localhost/wordpress
tar -xf /tmp/wordpress.tar.gz -C /var/www/localhost/
cp /tmp/wp-config.php /var/www/localhost/wordpress/wp-config.php

#PHPMYADMIN INSTALLATION
cd /tmp/
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.1/phpMyAdmin-4.9.1-english.tar.gz
tar xvf phpMyAdmin-4.9.1-english.tar.gz
mv phpMyAdmin-4.9.1-english/ /var/www/localhost/phpmyadmin


#SSL 

#mkdir ~/mkcert
#cd ~/mkcert
#wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64
#mv mkcert-v1.1.2-linux-amd64 mkcert
#chmod +x mkcert
#./mkcert -install
#./mkcert localhost
#rm ~/mkcert/mkcert

#START NGINX AND CLEAN

#rm /tmp/*
service nginx restart
