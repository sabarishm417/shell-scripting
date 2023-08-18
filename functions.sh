#!/bin/bash
USER = ${id - u}
if [ $USER -ne 0 ]
then
    echo " Run with Root user access"
    exit 1
fi
VALIDATE(){

if [ $1 -ne 0 ]
then
    echo " $2 installation failed"
else
    echo " $1 installion success"
fi

}
yum install python -y
VALIDATE $? "python"


yum install redis -y
VALIDATE $? "redis"