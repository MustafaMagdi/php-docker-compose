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
      php7.0 \
      php7.0-cli \
      php7.0-gd \
      php7.0-json \
      php7.0-ldap \
      php7.0-mysql \
      php7.0-pgsql \
      php7.0-curl \
      php7.0-mcrypt \
      php7.0-dev \
      php7.0-redis \
      php7.0-xml \
      php7.0-mbstring \
      php7.0-bcmath \
      libapache2-mod-php7.0 \
      php-pear

# node, npm and forever
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash - \
	&& apt-get install -y nodejs \
	&& npm update -g npm \
	&& npm install -g forever

# install Xdebug extension
RUN \
	pecl install xdebug
COPY etc/php/apache2/conf.d/20-xdebug.ini /etc/php/7.0/apache2/conf.d/20-xdebug.ini

# install Mongodb extension
RUN \
	pecl install mongodb
COPY etc/php/apache2/conf.d/20-mongodb.ini /etc/php/7.0/apache2/conf.d/20-mongodb.ini

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
