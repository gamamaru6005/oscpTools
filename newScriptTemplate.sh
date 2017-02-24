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
SUBJECT=some-unique-id
USAGE="Usage: command -hv args"

# --- Option processing --------------------------------------------
if [ $# == 0 ] ; then
    echo $USAGE
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
    *)
      echo "Unknown Argument $ARG" ;;
  esac
done
# --- Locks -------------------------------------------------------
LOCK_FILE=/tmp/${SUBJECT}.lock

if [ -f "$LOCK_FILE" ]; then
	echo "Script is already running"
	exit
fi

trap "rm -f $LOCK_FILE" EXIT
touch $LOCK_FILE

# -- Body ---------------------------------------------------------
#  SCRIPT LOGIC GOES HERE
echo "A: $A"
echo "B: $B"
# -----------------------------------------------------------------
