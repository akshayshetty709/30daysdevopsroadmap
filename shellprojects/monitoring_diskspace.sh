#!/bin/bash
#This script is to Monitor free disk space and sent an email notification
FU=$(df -H | egrep -v "Filesystem|tmpfs" | grep "/dev" | awk '{print$5}'| tr -d %)

TO="akshayshetty709@gmail.com"

if [[ $FU -gt 20 ]]
then
	echo " Warning space is low - $FU " | mail -s "Disk Usage Alert!" $TO
else 
	echo "All good"
fi
