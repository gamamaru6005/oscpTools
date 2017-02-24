#!/bin/bash
# ------------------------------------------------------------------
# [Ceafin] Frequency of IPs in a Given Log File
#          Pull out the frequency of a given log file's IP addresses
#
# ------------------------------------------------------------------
VERSION=0.1.0

# --- Usage Syntax -------------------------------------------------
usage() {
	echo -n "$0 [FILE] [DELIMETER] [FIELD]
In order to pull out all the IPs in a log file specify the file, delimeter, and 
field number of the IP addresses.
	Options:
		-h,  --help        Display this help and exit
		--version     Output version information and exit

	Parameters:
		FILE 	full or relative path to log file
		DELIMETER 	the delimeter in log entries
		FIELD 	field column to find the IP addresses

	Examples:
		$0 ./access.log ' ' 1
		$0 /var/log/access.log '|' 4
	"
}

# --- Option processing --------------------------------------------
# Parsing for Help or Version
for ARG in $*; do
	case $ARG in
		--version)
			echo "$0 : Version $VERSION"
			exit 0
			;;
		-h|--help)
			usage >&2
			exit 0
			;;
	esac
done

# If not enough arguements are passed
if [  $# -lt 3 ]
	then
	usage
	exit 1
fi

# -- Body ---------------------------------------------------------
#  SCRIPT LOGIC GOES HERE

cat $1 | cut -d "$2" -f $3 | sort | uniq -c | sort -urn

# -----------------------------------------------------------------
