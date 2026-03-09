#!/bin/bash
#Array
myArray=( 1 20 30.5 Hello "Hey Buddy" )

echo "value in 3rd index is ${myArray[3]}"

#how to find no. of values in array
echo "No. of values, length of array is ${#myArray[*]}"

#to get multiple index value 
echo "values from index 2-3 is ${myArray[*]:2:2}"

#how to update new values to array
myArray+=( Akshay 50 70 )
echo "values of my array is ${myArray[*]}"
