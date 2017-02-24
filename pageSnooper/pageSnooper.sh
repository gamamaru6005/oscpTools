#!/bin/bash
# -------------------------------------------------------------------------------
# [Ceafin] Site Scrubber
#          A script to scrub a web page for information of some type.
#
# -------------------------------------------------------------------------------
VERSION=0.1.0

# --- Usage Syntax -------------------------------------------------
usage() {
	echo -n "${basename} [OPTION]... [FILE]...
This is a script template.  Edit this description to print help to users.
 Options:
  -u, --url      Output all scrubbed URLs found in page
  -i, --ip       Output resolved URLs to their IPs
  -h, --help     Display this help and exit
      --version  Output version information and exit
"
}

# --- Option processing --------------------------------------------
# If not arguements are passed
if [ $# == 0 ] ; then
	usage
	exit 1;
fi

# Parse Parameters #
for ARG in $*; do
	case $ARG in
		-u|--url)
			U=true 
			;;
		-i|--ip)
			I=true
			;;
		--version)
			echo -n "${basename} : Version $VERSION"
			;;
		-h|--help)
			usage >&2
			exit 0
			;;
		*)
			echo "Unknown Argument $ARG" ;;
	esac
done

# -- Body ---------------------------------------------------------
#  SCRIPT LOGIC GOES HERE

echo "Retrieving the page: $1"
wget --quiet -O foo.html $1

echo "Pulling URLs in HTML Response"
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

# -----------------------------------------------------------------
