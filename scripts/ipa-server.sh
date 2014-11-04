#!/bin/bash

repfile=/var/lib/ipa/replica-info-ipa-server2.example.com.gpg

rm $repfile

yum install -y ipa-server bind bind-dyndb-ldap



domain=`dnsdomainname`
realm=`echo $domain|tr [a-z] [A-Z]`
pass=admin123

ipa-server-install \
-r $realm \
-n $domain \
-p $pass \
-a $pass \
--setup-dns --no-forwarders \
-U 


ipa-replica-prepare -p $pass  ipa-server2.example.com --ip-address=192.168.34.35


cp $repfile /vagrant/

rndc-confgen -a
restorecon -v /etc/rndc.key 
