#!/bin/bash

# script should be executed with sudo/root access.
if [[ "${UID}" -ne 0 ]]
then
	echo "Please run with sudo or root"
	exit 1
fi

# user should provide atlease one argument as username else guide him
if [[ "${#}" -lt 1 ]]
then
	echo "usage: ${0} USER_NAME [COMMENT]..."
	echo "create a user with name USER_NAME and comments field of COMMENT"
        exit 1
fi	
# store 1st argument as user name
USER_NAME="$1"
echo $USER_NAME

# in case of more than one argument, store it as account comments
shift
COMMENT="${@}"

# create a password
PASSWORD=$(date +%s%N)

# create a user
useradd -c $"{COMMENT}" -m $USER_NAME

#check if user is successfully created or not
if [[ $? -ne 0 ]]
then
	echo "The Account could not be created"
	exit 1
fi
#set the password for the user.
echo $PASSWORD | passwd --stdin $USER_NAME

#check if password is successfully set or not..
if [[ $? -ne o ]]
then
	echo "password could be not set"
	exit 1
fi

#Force password change on first login"
passwd -e $USER_NAME

#Display the username, password and the host where the user is created"
echo
echo "username: $USER_NAME"
echo
echo "password: $PASSWORD"
echo
echo $(hostname)
