#!/bin/sh

zone=$1

dig +short any $zone

for sub in mail pop imap webmail ftp www pay spay uatpay; do
	printf "${sub}  = "
	dig +short any ${sub}.$zone
	printf "\n"
done

