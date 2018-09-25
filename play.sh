#!/bin/bash
if [ $# -eq 1 ]; then
    VAR=$1
    echo "The var is $VAR"
fi

newpass=kingpin
FPMYSQLPWD=~/"MySQL-PWD.$(date +%Y%m%d_%H%M%S)"
echo $newpass >$FPMYSQLPWD

echo "Root Password for MySQL (stored in $FPMYSQLPWD): $newpass"
