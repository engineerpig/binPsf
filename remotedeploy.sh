#!/bin/sh
hostremote=lsa-wp-01.plus65host.net
ssh root@$hostremote 'mkdir /bk; cd /bk; wget https://wordpress.org/latest.tar.gz'
#ssh root@$hostremote 'sudo -H -u git bash -c "git clone git@git /var/www/html/test/" '
