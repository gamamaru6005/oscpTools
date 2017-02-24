#!/bin/bash
# ------------------------------------------------------------------
# [Ceafin] Simple Zone Transfer Bash Script
#          $1 is the first argument given after the bash script
#          Check if argument was given, if not, print usage 
#
# ------------------------------------------------------------------
VERSION=0.1.0

# --- Usage Syntax -------------------------------------------------
usage() {
	echo "[*] Simple Zone transfer script"
	echo "[*] Usage   : $0 <domain name> " 
}

# --- Option processing --------------------------------------------

# If not enough arguements are passed
if [ -z "$1" ]; then 
	usage
	exit 0 
fi
# -- Body ---------------------------------------------------------
#  SCRIPT LOGIC GOES HERE

for server in $(host -t ns $1 |cut -d" " -f4);do
	host -l $1 $server | grep "has address"
done

# -----------------------------------------------------------------
