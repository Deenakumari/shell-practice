#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R Error: please run this script as root access $N"
else
    echo "you are in root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
       echo -e "installing $2 is .... $G SUCCESS $N"
    else
       echo -e "installing $2 is .... $R failure $N"
       exit 1
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install it"
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "$Y MySQL is already installed...Nothing to do $N"
fi


dnf list installed python3

if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install it"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "$Y python3 is already installed...Nothing to do $N"
fi


dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "$Y nginx is already installed...Nothing to do $N"
fi