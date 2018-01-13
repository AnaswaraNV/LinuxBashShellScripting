#!/bin/bash

echo -n "Please enter a file to be read"
read filename

for i in {1..3}
do
if [[ -z "$filename" ]]
   then
       if ! (( $i == 3 )) 
         then 
       	       echo " file name entered is blank! enter again" 
               read filename 
       fi
       continue 
fi
 
if [[ -e $filename ]]
 then 
   echo "file exists"
   exit 1
  elif (( $i != 3 ))
   then 
   echo "does not exist"
   echo "enter again"
   read filename
fi
done

if (($i == 3 ))
   then 
	echo "goodbye!"
 fi
