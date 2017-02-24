#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
#
#          This script uses shFlags -- Advanced command-line flag
#          library for Unix shell scripts.
#          http://code.google.com/p/shflags/
#
# Dependency:
#     http://shflags.googlecode.com/svn/trunk/source/1.0/src/shflags
# ------------------------------------------------------------------
VERSION=0.1.0

# --- Usage Syntax -------------------------------------------------
usage() {
	echo -n "${scriptName} [OPTION]... [FILE]...
This is a script template.  Edit this description to print help to users.
 Options:
  -u, --username    Username for script
  -p, --password    User password
  --force           Skip all user interaction.  Implied 'Yes' to all actions.
  -q, --quiet       Quiet (no output)
  -l, --log         Print log to file
  -s, --strict      Exit script with null variables.  i.e 'set -o nounset'
  -v, --verbose     Output more information. (Items echoed to 'verbose')
  -d, --debug       Runs script in BASH debug mode (set -x)
  -h, --help        Display this help and exit
      --version     Output version information and exit
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
		-a|--alpha)
			A=true 
			;;
		-b=*|--beta=*)
			B=${ARG#*=} 
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
echo "A: $A"
echo "B: $B"
# -----------------------------------------------------------------
