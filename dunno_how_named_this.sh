#!/bin/bash just memos do not start on you computer

#------------------------------network interface diagnostic ----------------------------
# https://www.cyberciti.biz/faq/linux-list-network-interfaces-names-command/

ip link show

nmcli connection show

netstat -i

tcpdump --list-interfaces
#nice

#routing table
ip r


#How do I see arp cache connected to my NIC on Linux?
arp
arp -a
arp -e
arp -n
# On modern Linux distros use the ip command #
ip neigh
ip -s neigh

#oldschool "How to list all network devices connected to the PCI bus in Linux"
sudo lspci
# Filter out results using the "grep" or "egrep" #
sudo lspci | grep -Ei 'eth|network|ethernet|wireless|wifi'

#hw installed network card
sudo apt install lshw inxi hwinf

sudo hwinfo --short --netcard
sudo lshw -C network -short
sudo inxi -N

#linux as file
cat /proc/net/dev
ls -l /sys/class/net/
#see how to use
# https://www.cyberciti.biz/faq/linux-list-network-interfaces-names-command/

