ipset -N clients macipmap --network 192.168.240.0/24

ipset -A clients 192.168.241.41%00:21:85:c1:7f:83
ipset -A clients 192.168.242.219%00:0a:e6:86:0f:75
ipset -A clients 192.168.242.111%00:26:b6:66:d5:18

iptables -N WEW_SPOOF_DROPLOG
iptables -A WEW_SPOOF_DROPLOG -m hashlimit --hashlimit-upto 1/minute --hashlimit-name wew_spoof_log \
	--hashlimit-burst 1 -j LOG --log-prefix "WEW_SPOOF"
iptables -A SSH_BRUTE_DROPLOG -j REJECT


iptables -A IPS -i eth0 -m set ! --match-set clients src -J WEW_SPOOF_DROPLOG
