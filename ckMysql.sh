#!/bin/bash
 
  dbuser="root"
  dbpass="oldpassword"
 
  dbaccess="denied"
  until [[ $dbaccess = "success" ]]; do
    echo "Checking MySQL connection..."
    mysql --user="${dbuser}" --password="${dbpass}" -e exit 2>/dev/null
    dbstatus=`echo $?`
    if [ $dbstatus -ne 0 ]; then
      echo -e "MySQL Username [$dbuser]: \c "
      read dbuser
      # Check if user field is empty
      test "${dbuser}" == "" && dbuser="root";
      echo -e "MySQL Password: \c "
      read -s dbpass
      echo
    else
      dbaccess="success"
      echo "Success!"
    fi
  done

