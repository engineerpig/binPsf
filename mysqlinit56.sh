#!/bin/bash

#yum -y install expect

#tmppass=ABcd,12,34
#tmppass="$(grep 'temporary password' /var/log/mysqld.log | sed  's/^.*root@localhost: \(.*\)$/\1/g')"
#echo "${tmppass}"

NEW_MYSQL_PASSWORD=ABcd,12,34
CURRENT_MYSQL_PASSWORD=$tmppass

SECURE_MYSQL=$(expect -c "
set timeout 3
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"$CURRENT_MYSQL_PASSWORD\r\"
expect \"root password?\"
send \"y\r\"
expect \"New password:\"
send \"$NEW_MYSQL_PASSWORD\r\"
expect \"Re-enter new password:\"
send \"$NEW_MYSQL_PASSWORD\r\"
expect \"Remove anonymous users?\"
send \"y\r\"
expect \"Disallow root login remotely?\"
send \"y\r\"
expect \"Remove test database and access to it?\"
send \"y\r\"
expect \"Reload privilege tables now?\"
send \"y\r\"
expect eof
")

echo "$SECURE_MYSQL"
