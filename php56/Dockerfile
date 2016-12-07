FROM ubuntu:16.04
MAINTAINER Mustafa Magdi (https://github.com/devmustafa)

# install packages
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		software-properties-common \
		sudo \
		vim \
		wget \
		curl \
		git \
		zip \
		unzip \
		python \
		python-software-properties \
		build-essential\
		ant \
		libpq-dev \
		libcurl4-openssl-dev \
		pkg-config

# install PHP5
RUN apt-get update \
    && LANG=C.UTF-8 add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y \
      apache2 \
      php5.6 \
      php5.6-cli \
      php5.6-gd \
      php5.6-json \
      php5.6-ldap \
      php5.6-mysql \
      php5.6-pgsql \
      php5.6-curl \
      php5.6-mcrypt \
      php5.6-dev \
      php5.6-redis \
      php5.6-xml \
      php5.6-mbstring \
      php5.6-bcmath \
      libapache2-mod-php5.6 \
      php-pear

# node, npm and forever
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash - \
	&& apt-get install -y nodejs \
	&& npm -g update npm \
	&& npm -g install forever

# install Xdebug extension
RUN \
	pecl install xdebug
COPY etc/php/apache2/conf.d/20-xdebug.ini /etc/php/5.6/apache2/conf.d/20-xdebug.ini

# install Mongodb extension
RUN \
	pecl install mongodb
COPY etc/php/apache2/conf.d/20-mongodb.ini /etc/php/5.6/apache2/conf.d/20-mongodb.ini

# PHP modes
RUN a2enmod rewrite

# copy apache file
# COPY etc/apache2/sites-available/example.local.conf /etc/apache2/sites-available/example.local.conf

# composer
RUN \
  curl -sS https://getcomposer.org/installer | php && \
  mv composer.phar /usr/local/bin/composer && \
  composer config -g github-oauth.github.com aeff6491f52163a011cba0b6b6286f5492e25ab6

# update and clean
RUN apt-get update \
	&& apt-get clean \
	&& apt-get autoremove -y

# install redis
RUN apt-get install -y redis-server

# install amqp
RUN apt-get install -y rabbitmq-server

# run on startup
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# ports apache2, rabbitmq manager and xdebug
EXPOSE 80
EXPOSE 15672
EXPOSE 9000
