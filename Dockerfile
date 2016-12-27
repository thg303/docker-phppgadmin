FROM alpine:3.4
MAINTAINER Nadim

# Install webserver
RUN apk update
RUN apk add tar curl vim

RUN apk add apache2 php5-apache2 php5-pgsql postgresql
RUN mkdir -p /run/apache2

RUN mkdir -p /run/apache2 && \
	sed -i "s/ErrorLog .*/ErrorLog \/dev\/stdout/g" /etc/apache2/httpd.conf && \
	sed -i "s/CustomLog .* combined/CustomLog \/dev\/stdout combined/g" /etc/apache2/httpd.conf && \
	sed -i "s/DirectoryIndex .*/DirectoryIndex index.php index.html/g" /etc/apache2/httpd.conf

ENV PHPPGADMIN_VERSION=5.1
RUN cd /var/www/localhost/htdocs/ && \
    curl -L http://downloads.sourceforge.net/phppgadmin/phpPgAdmin-${PHPPGADMIN_VERSION}.tar.gz?download | tar xzvf - --strip-components=1 -C ./ && \
    cp /var/www/localhost/htdocs/conf/config.inc.php-dist /var/www/localhost/htdocs/conf/config.inc.php && \
    chmod -R 777 /var/www/localhost/htdocs/

EXPOSE 80
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]