#!/usr/bin/env sh
echo "Clean..."
./firewall_clean.sh
iptables -N IPS

echo "SSH Brute Force"
./firewall_brute.sh
echo "SYN Flood"
./firewall_syn_flood.sh
echo "Timestamp Request"
./firewall_timestamp_request.sh
echo "ACK Scan"
./firewall_ack_scan.sh
echo "Spoofing"
./firewall_spoofing_zew.sh


iptables -A INPUT -m state --state NEW -j IPS
