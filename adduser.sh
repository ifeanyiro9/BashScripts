#!/bin/bash

#This script will prompt a user to enter new user name to add to server. If the user name already exist, it will exit the script, but if it doesnt, it will succefully create the user.

echo "Please enter a new user name to add to server"

read username


getent passwd $username  > /dev/null


if [ $? -ne 0 ]; 

  then
	sudo useradd -m $username;
	echo "$username user has been added!"      
       
  else
	 echo "Unsuccessful. $username already exists."

fi
