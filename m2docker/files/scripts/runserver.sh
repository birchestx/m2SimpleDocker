#!/bin/bash

# Show what we execute
set -x

# MySQL authentication
MYSQLAUTH="--user=$MYSQL_USER --password=$MYSQL_PASSWORD"

# Wait for MySQL to come up.
until mysql $MYSQLAUTH -e ""; do
    echo "Failed to connect to MySQL - retrying..."
    sleep 1
done

mysql $MYSQLAUTH -e "CREATE DATABASE IF NOT EXISTS magento"

cd /var/www/magento2/htdocs
bin/magento setup:install \
	        --db-host=mysql \
		--db-name=magento \
		--db-user="$MYSQL_USER" \
		--db-password="$MYSQL_PASSWORD" \
		--backend-frontname=admin \
		--base-url=http://$PUBLIC_HOST/ \
		--admin-lastname=Smith \
		--admin-firstname=John \
		--admin-email=john.smith@example.com \
		--admin-user=admin \
		--admin-password=magento2 \

# Check permissions again
find . -type d -exec chmod 770 {} \; && find . -type f -exec chmod 660 {} \; && chmod u+x bin/magento
chown www-data:www-data -R /var/www/magento2


# In production mode we pre-compute various files
php -f dev/tools/Magento/Tools/View/deploy.php
php -f dev/tools/Magento/Tools/Di/compiler.php

# Run the web server
exec /usr/sbin/apache2 -D FOREGROUND
