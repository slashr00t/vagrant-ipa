#!/bin/bash

yum install -y ipa-server bind bind-dyndb-ldap




domain=`dnsdomainname`
realm=`echo $domain|tr [a-z] [A-Z]`
pass=admin123

repfile=/vagrant/replica-info-ipa-server2.example.com.gpg

timeout=600
wait=5
t=0

while ! [ -f $repfile ];do
	t=$[t+wait]	
	[ $t -ge $timeout ] && { echo "Timeout reached"; break; }
	echo "Waiting for $repfile to appear"
	sleep 10
done

[ -f $repfile ] || { echo "$f missing. Aborting."; exit 1; }

ipa-replica-install --setup-ca  -p admin123 -w admin123 $repfile && rm $repfile
