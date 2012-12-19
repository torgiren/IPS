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

iptables -F TIMESTAMP_DROPLOG
iptables -X TIMESTAMP_DROPLOG

iptables -F ACK_SCAN
iptables -X ACK_SCAN
iptables -F ACK_SCAN_DROPLOG
iptables -X ACK_SCAN_DROPLOG

iptables -F ZEW_SPOOF
iptables -X ZEW_SPOOF
iptables -F ZEW_SPOOF_DROPLOG
iptables -X ZEW_SPOOF_DROPLOG
