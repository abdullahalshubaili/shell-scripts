#!/bin/bash

ips=`tcpdump -ntr ~/Desktop/ransomware.pcapng | awk '{print $2}' >> ips.txt`
ipd=`tcpdump -ntr ~/Desktop/ransomware.pcapng | awk '{print $4}' >> ipd.txt`

grep -v [a-z] ips.txt | mawk -F "." '{print $1,$2,$3,$4}' | sed -e 's/\s/./g' > ips2.txt
grep -v [a-z] ipd.txt | mawk -F "." '{print $1,$2,$3,$4}' | sed -e 's/\s/./g' > ipd2.txt

sort ips2.txt | uniq -d > ips3.txt
sort ipd2.txt | uniq -d > ipd3.txt
rm ips.txt ips2.txt ipd.txt ipd2.txt
cat ips3.txt ipd3.txt > allip2.txt
sort allip2.txt | uniq -d > allip.txt
rm ips3.txt ipd3.txt allip2.txt
./whois.sh
#need to put orginaztion name
#ip="$(ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | awk '{print $2}')"
#ip2="$(echo mawk $ip -F "." '{print $1,$2,$3}' >$ip | grep -v $ip allip.txt >new.txt) > IP.txt"

#nmap -iL allip.txt --script=whois-ip.nse | grep 'for\|country' >> IPfindings.txt
