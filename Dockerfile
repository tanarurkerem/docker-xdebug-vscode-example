FROM php:apache as base
#Install needed package
#RUN apt-get update && apt-get install -y ...
#RUN docker-php-ext-install ...
#RUN pecl install ...
#RUN composer install
#...

FROM base as xdebug-base
RUN apt-get update && apt-get install -y ncat
RUN pecl install xdebug \
 && docker-php-ext-enable xdebug
COPY xdebug.ini	/usr/local/etc/php/conf.d

FROM xdebug-base as xdebug
COPY index.php /var/www/html/index.php

FROM base
COPY index.php /var/www/html/index.php

