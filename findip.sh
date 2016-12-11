#!/bin/bash

ips=`tcpdump -ntr ~/Desktop/ransomware.pcapng | awk '{print $2}' >> ips.txt`
ipd=`tcpdump -ntr ~/Desktop/ransomware.pcapng | awk '{print $4}' >> ipd.txt`

grep -v [a-z] ips.txt | mawk -F "." '{print $1,$2,$3,$4}' | sed -e 's/\s/./g' > ips2.txt
grep -v [a-z] ipd.txt | mawk -F "." '{print $1,$2,$3,$4}' | sed -e 's/\s/./g' > ipd2.txt

sort ips2.txt | uniq -d > ips3.txt
sort ipd2.txt | uniq -d > ipd3.txt


