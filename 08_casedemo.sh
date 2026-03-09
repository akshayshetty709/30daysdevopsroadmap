#!/bin/bash

echo "Read an an option"
echo "a for print date"
echo "b for list of scripts"
echo "c to check current location"

read choice

case $choice in
	a)date;;
	b)ls;;
	c)pwd;;
	*)echo "please provide an valid option"
esac
