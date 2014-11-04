#!/bin/bash

yum install -y ipa-client openldap-clients


cat << EOF > /etc/resolv.conf
nameserver 192.168.34.34
EOF


domain=`dnsdomainname`
realm=`echo $domain|tr [a-z] [A-Z]`
pass=admin123

ipa-client-install -U -w $pass --domain=$domain -p admin --force-join

authconfig --update --enablesssd --enablesssdauth --enablemkhomedir
