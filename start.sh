#!/bin/sh
sed "s/Listen [0-9]*/Listen ${PORT:-80}/g" /etc/apache2/httpd.conf

sed -i "s/conf\['servers'\]\[0\]\['host'\] = '.*'/conf['servers'][0]['host'] = '${DB_HOST:-db}'/" /var/www/localhost/htdocs/conf/config.inc.php
sed -i "s/conf\['servers'\]\[0\]\['port'\] = [0-9]*/conf['servers'][0]['port'] = ${DB_PORT:-5432}/g" /var/www/localhost/htdocs/conf/config.inc.php

httpd -D FOREGROUND