#!/bin/bash
#how to store key value pairs
declare -A myArray
myArray=( [name]=Shetty [age]=35 [city]=tumkur )
echo "Name is ${myArray[name]}"
