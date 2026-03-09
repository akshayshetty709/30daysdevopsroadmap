#!/bin/bash
#$Revision:001$
#$Fri Dec 16 20:02:55 IST 2022$

#Variables
BASE=/home/paul/tutorials/find_command
DAYS=10
DEPTH=1
RUN=0

#Check if the directory is present or not

if [ ! -d $BASE ]
then
	echo "directory does not exist: $BASE"
        exit 1
fi

#check Archieve folder present or not

if [ ! -d $BASE/archieve ]
then
	mkdir -p $BASE/archieve
fi
#Find the list of files larget than 20MB

for i in 'find $BASE -maxdepth $DEPTH -type f -size +20M'
do
	if [ $RUN -eq 0 ]
	then
		gzip $i || exit 1
		mv $i.gz $BASE/archive || exit 1
	fi	

done
