#!/bin/bash

#read filename and check if it exists

echo "Enter a filename"
read FileName

for i in {1..3}
do
#check if user entered an empty value 
  if [[ -z "$FileName" ]]
     then 
          echo "Enter a fileNAme"

     elif  ! [ -e $FileName ] && ! [[ -z "$FileName" ]]  
         then
	     echo "invalid file name! file you entered doesn't exist!"
             echo "Please try again!"
 	     read $FileName
     elif [ -e $FileName ] && ! [[ -z "$FileName" ]]
     	 then  
              echo "File exists! Thanks!"
              exit 1
  fi 
done

if (( $i > 1))
  then 
      echo "You have tried 3 times! Please re run the command again!"
      exit 2
   else 
      echo "File you entered exists! Thanks!"
fi
 
