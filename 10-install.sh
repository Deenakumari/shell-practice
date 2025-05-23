#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR: please run this script with root user"
    exit 1 #give other than 0 upto 127
else
    echo "you are running with root access"
fi

dnf list installed mysql

# check already installed or not . if installed $? is 0. than
# if not installed $? is not 0. expression is true

if [ $? -ne 0 ]
then
   echo "mysql is not installed .... going to install"
   dnf install mysql -y
   if [ $? -eq 0 ]
   then
      echo "installing mysql is .... sucess"
   else
      echo "installing mysql is ..... failure"
      exit 1
    fi  
else
   echo "mysql is already installed .... nothing to do"
fi   

# dnf install mysql -y

# if [ $? -eq 0 ]
# then
#    echo "installing mysql is .... sucess"
# else
#    echo "installing mysql is ..... failure"
#    exit 1
# fi 