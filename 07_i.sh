#!/bin/bash
read -p "enter your marks?" marks
if [[  $marks -gt 40 ]]
then
	echo "your pass"
else
	echo "your fail!!!!!"
fi
