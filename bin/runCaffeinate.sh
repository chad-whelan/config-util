#!/bin/bash 

#caffeinate -dimsu -t 14400

SLEEP_SECONDS=32400 

if [ "$#" -eq "1" ] && [ "$1" -eq "$1" ] 2>/dev/null; then 
  echo "Sleeping for [$1]"
  SLEEP_SECONDS=$1
elif [ "$#" -eq "1" ] 2>/dev/null; then 

  echo "run by calling 'runCaffeinate' to use the default of 32,400 seconds, or 'runCaffeinate <seconds>' to specifiy how long to run:"
  echo "   3600   One Hour"
  echo "   14400  Four Hours"
  echo "   21600  Six Hours"
  echo "   32400  Nine Hours"
  exit

fi


caffeinate -udt $SLEEP_SECONDS &
#echo "running caffeinate -udt $SLEEP_SECONDS &"

