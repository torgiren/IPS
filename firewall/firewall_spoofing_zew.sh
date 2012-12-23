iptables -N ZEW_SPOOF_DROPLOG
iptables -A ZEW_SPOOF_DROPLOG -m hashlimit --hashlimit-upto 1/minute --hashlimit-name wew_spoof_log \
	--hashlimit-burst 1 -j LOG --log-prefix "IPS: ZEW_SPOOF "
iptables -A ZEW_SPOOF_DROPLOG -j REJECT

iptables -N ZEW_SPOOF
iptables -A ZEW_SPOOF -s 192.168.0.0/16 -j ZEW_SPOOF_DROPLOG
iptables -A ZEW_SPOOF -s 172.16.0.0/12 -j ZEW_SPOOF_DROPLOG
iptables -A ZEW_SPOOF -s 127.0.0.0/8 -j ZEW_SPOOF_DROPLOG
iptables -A ZEW_SPOOF -s 10.0.0.0/8 -j ZEW_SPOOF_DROPLOG

iptables -A IPS -i eth1 -j ZEW_SPOOF
