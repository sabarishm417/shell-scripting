#!/bin/bash


# our program goal is to install mysql

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

USERID=$(id -u)
# this function should validate the previous command and inform user it is success or failure
VALIDATE(){
    #$1 --> it will receive the argument
    if [ $1 -ne 0 ]
    then 
        echo -e "$2.. $R FAILURE $N"
        exit 1
    else 
        echo -e "$2...  $G SUCCESS $N"
    fi
}
if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1

# else
#   echo "INFO:: You are root user"
fi

# it is our responsibility again to check installation is success or not

yum install mysql -y

VALIDATE $? "Installing MYSQL"

yum install postfixx -y

VALIDATE $? "Installing POSTFIX"