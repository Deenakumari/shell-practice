#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR: please run this script with root user"
    exit 1 #give other than 0 upto 127
else
    echo "you are running with root access"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
   echo "installing mysql is .... sucess"
else
   echo "installing mysql is ..... failure"
fi 