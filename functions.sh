#!/bin/bash
USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo " $2 installation failed"
    else
        echo " $1 installion success"
    fi
}  

if [ $USERID -ne 0 ]
then
    echo " Run with Root user access"
    exit 1
fi


yum install python -y
VALIDATE $? "python"


yum install redis -y
VALIDATE $? "redis"