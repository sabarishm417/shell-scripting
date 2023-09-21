#!/bin/bash
DATE=$(date +%F)
LOGSDIR=/shell-scripting/shellscript-logs

USERID=$(id -u)
R="\e[31m"
N="\e[0m"

if [ $USERID -ne 0 ]
then 
    echo -e "$R ERROR: Please run this script with root access $N"
    exit 1
fi

#all args are in $@
for i in $@
do
    yum list installed $i 
    if [ $? -ne 0 ]
    then 
        echo "$i is not installed, let's install it"
        yum install $i -y
    else    
        echo -e "$Y $i is already installed $N"
    fi
done





