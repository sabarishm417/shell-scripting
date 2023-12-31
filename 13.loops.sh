#!/bin/bash
DATE=$(date +%F)
LOGSDIR=/home/redhatvm/shell-scripting/shellscript-logs
LOGFILE=$LOGSDIR/$0-$DATE.log
USERID=$(id -u)
R="\e[31m"
N="\e[0m"

if [ $USERID -ne 0 ]
then 
    echo -e "$R ERROR: Please run this script with root access $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$ installing $2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "Installing $2 .. $G SUCCESS $N"
    fi
}

#all args are in $@
for i in $@
do
    yum list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then 
        echo "$i is not installed, let's install it"
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else    
        echo -e "$Y $i is already installed $N"
    fi
done





