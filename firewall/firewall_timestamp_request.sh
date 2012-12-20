iptables -N TIMESTAMP_DROPLOG
iptables -A TIMESTAMP_DROPLOG
iptables -A TIMESTAMP_DROPLOG -m hashlimit --hashlimit-upto 1/minute --hashlimit-name timestamp_log \
	--hashlimit-burst 1 -j LOG --log-prefix "ICMP_TIMESTAMP_REQUEST"
iptables -A TIMESTAMP_DROPLOG -j REJECT

iptables -A IPS -p icmp --icmp-type 13 -j TIMESTAMP_DROPLOG

