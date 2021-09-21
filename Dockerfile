FROM php:7.4.1-apache
COPY .docker/php/php.ini /usr/local/etc/php/
COPY . /src/app
COPY .docker/apache/vhost.conf /etc/apache2/sites-available/000-default.conf

RUN docker-php-ext-install PDO_PGSQL DSN

RUN apt-get update

RUN apt-get install libpq-dev -y

RUN docker-php-ext-install pdo_pgsql