echo "Czyszczenie"
iptables -F 
iptables -F SYN_FLOOD
iptables -X SYN_FLOOD
iptables -F SYNS
iptables -X SYNS
iptables -F SSH_BRUTE
iptables -X SSH_BRUTE
iptables -F ICMP
iptables -X ICMP
iptables --policy INPUT DROP

echo "SYN_FLOOD"
iptables -N SYN_FLOOD
iptables -A SYN_FLOOD -m recent --set --name RECENT_SYNS_LOG
#iptables -A SYN_FLOOD -m recent --rcheck --name RECENT_SYNS_LOG -m limit --limit 1/minute -j LOG --log-prefix "SYN_FLOOD: "
iptables -A SYN_FLOOD -m recent --rcheck --name RECENT_SYNS_LOG --seconds 60 --hitcount 2  -j DROP
#iptables -A SYN_FLOOD -m recent --set --name RECENT_SYNS_LOG -j LOG --log-prefix "SYN_FLOOD: "
iptables -A SYN_FLOOD -j LOG --log-prefix "SYN_FLOOD: "
iptables -A SYN_FLOOD -j DROP

echo "SYNS"
iptables -N SYNS
iptables -A SYNS -m recent --set --name RECENT_SYNS
iptables -A SYNS -m recent --update --seconds 60 --hitcount 4 --name RECENT_SYNS -j SYN_FLOOD

echo "Brute Force"
iptables -N SSH_BRUTE
iptables -A SSH_BRUTE -p tcp --dport 22 -m limit --limit 10/minute -j LOG --log-prefix "SSH_BRUTE_FORCE"
iptables -A SSH_BRUTE -p tcp --dport 22 -m limit --limit 4/minute -j ACCEPT
iptables -A SSH_BRUTE -j DROP

echo "ICMP"
iptables -N ICMP
iptables -A ICMP -p icmp --icmp-type echo-request -m limit --limit 5/second -j DROP
iptables -A ICMP -j DROP

echo "MAIN"

echo "Akceptacja nawiazanych"
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --tcp-flags ALL SYN -j SYNS
iptables -A INPUT -p tcp --dport 22 -j SSH_BRUTE
iptables -A INPUT -p icmp --icmp-typ echo-request -j ICMP
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
