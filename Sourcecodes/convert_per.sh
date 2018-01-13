#!/bin/bash

#reading valid permissions for now 
#converting to octal

RegEx='^([r-][w-][x-]){3}$'

echo "enter the permission - valid" 
read FilePermission
#echo ${FilePermission:0:3} 

#awk '{StrDivision=substr(,3);
#      print StrDivision;
#      gsub("r","4",StrDivision);
#      gsub("w","2",StrDivision);
#      gsub("x","1",StrDivision);
#      gsub("-","0",StrDivision);
#      print StrDivision  }'

awk '{print substr($FilePer
 
