#!/usr/bin/env sh
./firewall_clean.sh
iptables -N IPS

iptables -N SSH_BRUTE_DROPLOG
iptables -A SSH_BRUTE_DROPLOG
iptables -A SSH_BRUTE_DROPLOG -m hashlimit --hashlimit-upto 1/minute --hashlimit-name burute_log --hashlimit-burst 1 -j LOG --log-prefix "SSH_BRUTEFORCE"
iptables -A SSH_BRUTE_DROPLOG -j REJECT


iptables -N SSH_BRUTE
iptables -A SSH_BRUTE -m hashlimit --hashlimit-above 5/minute --hashlimit-mode srcip --hashlimit-name ssh_brute -j SSH_BRUTE_DROPLOG






iptables -A IPS -p tcp --dport 22 -j SSH_BRUTE

iptables -A INPUT -m state --state NEW -j IPS

