#!/bin/bash

#This script to accept user name(s) as arguments to add new users to server. If one of the user names already exist, it will exit the script, but if it doesnt, it will succefully create the user.

#For loop to iterate through arguments
for i in $*
do

	#Check if username is in passwd database and send all other unimportant information to /dev/null
	getent passwd $i  > /dev/null

	#Use $? to find return value of last command. If username was found, it will return 0. We can check if $username exist by the condition if statement. 
	 
		if [ $? -ne 0 ]; 

			#Add user if return value is not equal to 0
  			then
				sudo useradd -m $i;
				echo "$i user has been added!" 

			#Notify that user already exist and exit script
  			else
	 			echo "Unsuccessful. $i already exists."

		fi
done
