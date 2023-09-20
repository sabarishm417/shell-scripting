#!/bin/bash

# Compare two numbers

echo "Enter a Value: "
read a
echo "Enter b Value: "
read b

if [ $a -eq $b ]
then
echo " a is greaterthan or equal to b "
else
echo " a is lessthan or  equals to b "
fi