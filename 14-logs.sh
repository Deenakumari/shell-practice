#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script started executing at: $(date)" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R Error: please run this script as root access $N" &>>$LOG_FILE
else
    echo "you are in root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
       echo -e "installing $2 is .... $G SUCCESS $N" &>>$LOG_FILE
    else
       echo -e "installing $2 is .... $R failure $N" &>>$LOG_FILE
       exit 1
    fi
}

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install it" &>>$LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else
    echo -e "$Y MySQL is already installed...Nothing to do $N" &>>$LOG_FILE
fi


dnf list installed python3 &>>$LOG_FILE 

if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install it" &>>$LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "$Y python3 is already installed...Nothing to do $N" &>>$LOG_FILE
fi


dnf list installed nginx &>>$LOG_FILE  

if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it" &>>$LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "$Y nginx is already installed...Nothing to do $N" &>>$LOG_FILE
fi