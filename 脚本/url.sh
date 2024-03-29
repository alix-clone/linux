#!/bin/bash
% watch_website.sh http://ticketek.com.au/ 'Ke[sS$]+ha' andrewt@cse.unsw.edu.au  
 
 
repeat_seconds=300  #check every 5 minutes  
 
if test $# = 3  
then  
    url=$1  
    regexp=$2  
    email_address=$3  
else  
    echo "Usage: $0 <url> <regex>" 1>&2  
    exit 1  
fi  
 
while true  
do  
    if wget -O- -q "$url"|egrep "$regexp" >/dev/null  
    then  
        echo "Generated by $0" | mail -s "$url now matches $regexp" $email_address  
        exit 0  
    fi  
    sleep $repeat_seconds  
done
