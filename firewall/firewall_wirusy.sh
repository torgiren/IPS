iptables -N WIRUSY_DROPLOG
iptables -A WIRUSY_DROPLOG
iptables -A WIRUSY_DROPLOG -m hashlimit --hashlimit-upto 1/minute --hashlimit-name wirusy_log \
	--hashlimit-burst 1 -j LOG --log-prefix "WIRUSY"
iptables -A WIRUSY_DROPLOG -j REJECT

iptables -N WIRUSY
iptables -A WIRUSY -m recent --set --name wirusy
iptables -A WIRUSY -m recent --update --seconds 60 --hitcount 5 --name wirusy -j WIRUSY_DROPLOG

iptables -A IPS -p tcp --dport 25 -j WIRUSY 
