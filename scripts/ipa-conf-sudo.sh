#!/bin/bash


echo 'sudoers: files ldap' >> /etc/nsswitch.conf


kinit admin

[ $? -eq 0 ] || { echo "Aborting"; exit 1; }

pass=admin123

ldappasswd -Y GSSAPI -h ipa-server1.example.com uid=sudo,cn=sysaccounts,cn=etc,dc=test,dc=lvo -s $pass

cat << EOF >> /etc/sudo-ldap.conf

binddn uid=sudo,cn=sysaccounts,cn=etc,dc=test,dc=lvo
bindpw $pass
ssl start_tls
tls_cacertfile /etc/ipa/ca.crt
tls_checkpeer yes
bind_timelimit 5
timelimit 15
# WARNING - it has to be ldap - NOT ldaps, start_tls makes sure it still uses encryption
uri ldap://ipa-server1.example.com ldap://ipa-server2.example.com
sudoers_base ou=SUDOers,dc=test,dc=lvo

EOF

echo NISDOMAINNAME="example.com" >> /etc/sysconfig/network
nisdomainname example.com
