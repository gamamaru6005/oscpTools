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
This is a script template.  Edit this description to print help to users.
 Options:
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
		--version)
			echo "$0 : Version $VERSION"
			exit 0
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



# -----------------------------------------------------------------
