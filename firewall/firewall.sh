#!/usr/bin/env sh
./firewall_clean.sh
iptables -N IPS

./firewall_brute.sh
./firewall_syn_flood.sh
iptables -A INPUT -m state --state NEW -j IPS
