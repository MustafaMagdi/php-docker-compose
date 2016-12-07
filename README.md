# docker-compose


Its a two different docker images build on Ubuntu 16.04 and the only different between them, is the php version, the first one based on php5.6 and the second one based on php7.0, so it will be easy to switch versions.


### other applications


* Apache2
* A bunch of PHP modules (mysql, psql, redis, mongodb, xdebug and so on)
* Nodejs, npm and forever
* Composer
* Redis
* Rabbitmq


### build


    docker-compose up


### run


    docker-compose run php56 // for php5.6
    docker-compose run php70 // for php7.0


### configuration


* I prefer adding all of my db files (like postgres/mongodb) on the local machine, don't forget to enable firewall ports 3306 (MySql), 5432 (Postgres) and 27017 (MongoDB) on your local machine


	ufw allow 5432/tcp


	ufw allow 3306/tcp


	ufw allow 27017/tcp


* Note that the dir volume: `~/www` , is shared between your containers
* Befor you run the images you can add authentication for redis through `docker-entrypoint.sh`
* You can add new user to rabbitmq through `docker-entrypoint.sh`
