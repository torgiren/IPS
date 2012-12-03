#!/usr/bin/env sh
./firewall_clean.sh
iptables -N IPS

./firewall_brute.sh
iptables -A INPUT -m state --state NEW -j IPS

