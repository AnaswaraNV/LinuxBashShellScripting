#!/bin/bash

#read filename and check if it exists

echo "Enter a filename"
read FileName

RegEx=^\ +$

if [[ "$FileName" =~ $RegEx ]]
  then 
      echo "contain spaces" 
fi

echo "File name entered is $fileName"
counter=1

while ! [[ $FileName == "" ]] && (( $counter < 3 ))  
do 
if ! [[ -a $FileName ]]
  then
	echo "File you entered does not exist! Please give a valid file!"
	((counter=counter+1))
 	read $FileName
 fi
done 

if ((counter==3))
  then 
      echo "3 tries"
      exit 1
   else 
      echo "good file Name"
fi 
