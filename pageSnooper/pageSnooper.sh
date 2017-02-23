#!/bin/bash

echo "Retrieving the page: $1"
wget --quiet -O foo.html $1

echo "Pulling URLs in HTML Response"
#grep "href=" foo.html | cut -d "/" -f 3 | grep "\." | cut -d '"'  -f 1 | sort -u > temp.txt
cat foo.html | grep -o 'http[s]*://[^"]*' | cut -d "/" -f 3 | sort -u > urls.txt

COUNT=$(wc -l urls.txt | awk '{print $1}')
echo "Resolving IPs for $COUNT URLs Found"

echo "" > ipAddr.txt
for url in $(cat urls.txt)
    do
    	host $url | grep "has address" | cut -d " " -f 4 | sort -u >> ipAddr.txt
    	COUNT=$((COUNT-1))
    	printf "$COUNT "
done 
echo -e "\n"

echo "Finished. Created: urls.txt and ipAddr.txt"
