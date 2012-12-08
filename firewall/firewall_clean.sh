#!/usr/bin/env sh
iptables -D INPUT -m state --state NEW -j IPS
iptables -F IPS
iptables -X IPS
iptables -F SSH_BRUTE
iptables -X SSH_BRUTE
iptables -F SSH_BRUTE_DROPLOG
iptables -X SSH_BRUTE_DROPLOG

iptables -F SYN_FLOOD
iptables -X SYN_FLOOD
iptables -F SYN_FLOOD_DROPLOG
iptables -X SYN_FLOOD_DROPLOG

