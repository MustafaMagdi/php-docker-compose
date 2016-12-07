#!/bin/bash

# variables
RABBITMQ_USER="user"
RABBITMQ_PASS="pass"
REDIS_PASS="pass"

# start services
service apache2 restart
service redis-server start
service rabbitmq-server start

# enable apache2 websites
# a2ensite example.local.conf

# configure rabbitmq
rabbitmq-plugins enable rabbitmq_management
rabbitmqctl add_user $RABBITMQ_USER $RABBITMQ_PASS
rabbitmqctl set_user_tags $RABBITMQ_USER administrator
rabbitmqctl set_permissions -p / $RABBITMQ_USER ".*" ".*" ".*"
rabbitmqctl delete_user guest
service rabbitmq-server restart

# configure redis
redis-cli CONFIG SET requirepass $REDIS_PASS

# open bash
/bin/bash
