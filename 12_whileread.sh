#!/bin/bash
while read myvar
do
	echo "Valur from file is $myvar"
done < names.txt

