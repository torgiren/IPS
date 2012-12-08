iptables -N SYN_FLOOD_DROPLOG
iptables -A SYN_FLOOD_DROPLOG
iptables -A SYN_FLOOD_DROPLOG -m hashlimit --hashlimit-upto 1/minute --hashlimit-name syn_flood_log \
	--hashlimit-burst 1 -j LOG --log-prefix "SYN_FLOOD"
iptables -A SYN_FLOOD_DROPLOG -j REJECT

iptables -N SYN_FLOOD
iptables -A SYN_FLOOD -m hashlimit --hashlimit-above 1/second --hashlimit-mode srcip \
	--hashlimit-name syn_flood --hashlimit-burst 5 -j SYN_FLOOD_DROPLOG

iptables -A IPS -p tcp --tcp-flags ALL SYN -j SYN_FLOOD

