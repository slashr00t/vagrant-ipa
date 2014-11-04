#!/bin/bash

yum -y install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum install -y screen vim mc tcpdump sysstat bind-utils
yum update -y 

cat << EOF >> /etc/screenrc
caption always "%{wk}%?%-Lw%?%{bw}%n*%f %t%?(%u)%?%{wk}%?%+Lw %=%{mk}@%H %{yk}%D %{ck}%M%{wk} %{ck}%d %{gk}%c"
EOF

cat << EOF > /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
192.168.34.34 ipa-server1.example.com ipa-server1
192.168.34.35 ipa-server2.example.com ipa-server2
192.168.34.36 ipa-server3.example.com ipa-server3
192.168.34.101 ipa-host1.example.com ipa-host1
192.168.34.102 ipa-host2.example.com ipa-host2
EOF


