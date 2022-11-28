#!/bin/bash

#This script will prompt a user to enter new user name to add to server. If the user name already exist, it will exit the script, but if it doesnt, it will succefully create the user.

#Prompt user to type user name to add
echo "Please enter a new user name to add to server"

#Read in input and save to username variable
read username

#Check if username is in passwd database and send all other unimportant information to /dev/null
getent passwd $username  > /dev/null

#Use $? to find return value of last run command. If username was found, it will return 0. Therefore we can check if $username exist by accessing the condition through if statement. 
 
if [ $? -ne 0 ]; 

#Add user if return value is not equal to 0
  then
	sudo useradd -m $username;
	echo "$username user has been added!"      
	
        echo "Enter password for $username"      
	sudo passwd $username;

#Notify that user already exist and exit script
  else
	 echo "Unsuccessful. $username already exists."

fi
