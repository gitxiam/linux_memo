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


#directory info via ls
ls -ld

#info about inode and all files
ls -ai

#chain not created directories
mkdir -p testdirectory1/testdirectory2/testdirectory3

#Regex crossword lol for training
#https://regexcrossword.com/

# ps for process show in terminal
ps aux #my favorite
ps au #users process
ps f #childrens and parents flows


#Below are some additional operations with variables:
${#array[@]} - the size of the array.
${{!arr[@]} - get array indexes
arr[0]=value - overwrites the first element of the array
arr+=(value) - attaching the value to the array
str=$(ls) - saving the output of the ls command as a string
${arr[@]:s:n} - get array elements starting from the element with index s up to the element with index s+(n-1).
${VAR:pos} - substring from pos position
${VAR:pos:len} - substring from position pos with length length length
${VAR?err_msg} - checks if VAR is defined, its value is returned, otherwise print err_msg
${#VAR} - returns the number of characters(length) of the variable value.

# functions in bash
#!/bin/bash
clear

function testFunc {

for VAR in 1 8 3 4 6 7 1 9 30; do
if (( VAR % 2 == 1 )); then
continue; fi
echo $VAR
done

}

# and eecute in script, don't forget!
testFunc
echo "script finished"

