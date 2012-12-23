iptables -N ACK_SCAN_DROPLOG
iptables -A ACK_SCAN_DROPLOG
iptables -A ACK_SCAN_DROPLOG -m hashlimit --hashlimit-upto 1/minute --hashlimit-name ack_scan_log \
	--hashlimit-burst 1 -j LOG --log-prefix "IPS: ACK_SCAN "
iptables -A ACK_SCAN_DROPLOG -j REJECT

iptables -N ACK_SCAN
iptables -A ACK_SCAN -j ACK_SCAN_DROPLOG

iptables -A IPS -p tcp -m state --state NEW --tcp-flags ALL ACK -j ACK_SCAN
