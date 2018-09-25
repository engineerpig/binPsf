#!/bin/bash
#
# Usage: $0 <OPTIONS> 
#
# Options: -n, Number of Characters
# Example:
#    # to randomize 10 digits number 
#    $0 -n 10 

#### Arguments Parser ####
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -n|--numchar)
    NUMCHAR="$2"
    shift # past argument
    shift # past value
    ;;
    -h|--help)
    HELP="$2"
    echo "Usage: $0 -n <Number of Characters for Password>"
    exit 0
    shift # past argument
    shift # past value
    ;;
    --default)
    DEFAULT=YES
    shift # past argument
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

#### Verify Arguments ####
# default to 8 (4+4) characters for randomized password
if [ "$((NUMCHAR))" -lt 8 ]; then 
	NUMCHAR=4
else
	NUMCHAR=$((NUMCHAR-4))
fi

#### Functions ####
choose() 
{ 
	echo ${1:RANDOM%${#1}:1} $RANDOM; 
}

chooseNotUsed()
{ 
	echo "$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c16)" 
}

genpass()
{
 	pass="$({ 
#  choose '!@#$%^&_-'
  	choose '!#$%&()+,-./:;<=>?@^_'
  	choose '0123456789'
  	choose 'abcdefghijklmnopqrstuvwxyz'
  	choose 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
# for randomized 8-16 character, for i in $( seq 1 $(( 4 + RANDOM % 8 )) )
# to generate 14 char password 
  	for i in $( seq 1 $(( $NUMCHAR )) )
     	do
#        choose '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
        	choose '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&'
     	done
 	} | sort -R | awk '{printf "%s",$1}')"
	echo "${pass}"

}

######## MAIN ########
genpass
