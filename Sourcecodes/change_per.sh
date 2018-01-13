#!/bin/bash 

#part2: assuming the file exist i am going to rad the permissions
#for now reading the existing file from user


echo "Enter a file name"
read FileName

ls -l $FileName

echo "What permission you would like for this file ?"
echo "permission format is [r or-] [w or -] [ x or -] respectively for creator, group, others"

read FilePermission

RegEx = ^([r-][w-][x-]){3}$
for i in {1..3}
do 
   while ! [[ "$FilePermission" == $RegEx ]]
        do 
           echo "The format you entered is wrong!"
           echo "Please enter a valid permission"
           read FilePermission
        done 
done 

if (( $i > 3 ))
   then 
        echo " You have tried 3 times"
   else 
        echo "format is good" 
fi
