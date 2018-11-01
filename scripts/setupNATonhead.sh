#!/bin/bash

nmcli connection modify eno1 connection.zone external
nmcli connection modify eno4 connection.zone internal

sysctl net.ipv4.ip_forward

firewall-cmd --zone public --query-masquerade
firewall-cmd --zone=external --add-masquerade --permanent
firewall-cmd --zone=external --query-masquerade

firewall-cmd --zone=external --add-forward-port=port=22:proto=tcp:toport=1234
firewall-cmd --zone=external --add-forward-port=port=22:proto=tcp:toport=22:toaddr:205.172.168.144

firewall-cmd --direct --add-rule ipv4 nat POSTROUTING 0 -o eno1 -j MASQUERADE

firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -i eno4 -o eno1 -j ACCEPT
firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -i eno1 -o eno4 -m state --state RELATED,ESTABLISHED -j ACCEPT

firewall-cmd --reload



#trouble -> https://www.server-world.info/en/note?os=CentOS_7&p=firewalld&f=2
