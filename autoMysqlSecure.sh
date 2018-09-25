#!/bin/bash
#
# Require Expect , yum install -y expect
#
# Usage: $0 <New Password>
#

# get new password from cmdline, if not use default
if [ $# -eq 1 ]; then
    newpass=$1
else
    newpass=ABcd,12,34
fi

# grep the temporary password created by mysql
tmppass="$(grep 'temporary password' /var/log/mysqld.log | sed  's/^.*root@localhost: \(.*\)$/\1/g')"
echo "${tmppass}"


SECURE_MYSQL=$(expect -c "
set timeout 10
spawn mysql_secure_installation
expect \"Enter password for user root:\"
send \"${tmppass}\r\"
expect \"New password:\"
send \"$newpass\r\"
expect \"Re-enter new password:\"
send \"$newpass\r\"
expect \"Change the password for root ?\"
send \"n\r\"
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

FPMYSQLPWD=~/"MySQL-PWD.$(date +%Y%m%d_%H%M%S)"
echo $newpass >$FPMYSQLPWD

echo "Root Password for MySQL (stored in $FPMYSQLPWD): $newpass"

