## iptables ##

- Display current rules

        iptables -L

- Flush rules from memory

        iptables -F
    
- Rules file
    
        /etc/iptables.up.rules

- load rules file

        iptables-restore < /etc/iptables.up.rules

- save rules file

        iptables-save > /etc/iptables.test.rules

- network startup script
    
        /etc/network/if-pre-up.d/iptables