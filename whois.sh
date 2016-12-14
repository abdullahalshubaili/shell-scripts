#!/bin/bash

ip_list="allip.txt"

while read line 
do
	    name=$line
	        echo "Looking up ${line}..."
		    echo IP_address $line >> whoising.txt
		    whois $name  >> whoising.txt 
		        sleep 1
		done < $ip_list
#echo "\n... \n... \n... \n"
grep 'country\|Country\|IP_address\|OrgName\|org' whoising.txt | grep -i -v 'comment\|type\|ref\|email' >> IPs.txt
cat IPs.txt
#grep 'country\|Country\|IP_address\|"OrgName"\|org' whoising.txt >> IPs.txt
#to merge every two line in one
#paste -d " " - - < IPs.txt
