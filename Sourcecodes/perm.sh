#!/bin/bash


echo "Welcome to our program!!!"
echo 

# Prompting the user for filename 

ReadFileName() {

echo -n "Please enter a filename : "
echo 
read fileName

}


#Processing the filename that user entered

FileNameProcess() {

for i in {1..3}
do

#checking if user entered an empty value as input 
# if empty, read filename again!

if [[ -z "$fileName" ]]
   then
       if ! (( $i == 3 ))
         then
               echo " The file name you entered is blank!" 
               ReadFileName
       fi
       continue
fi

#check if file exists or not

if [[ -e $fileName ]]
 then
   return 1

  elif (( $i != 3 ))
   then

   echo -n "File does not exist!"
   ReadFileName

fi
done

#Exit the program if user tried entering the filenames 3 times 

if (($i == 3 ))
   then
        echo 
        echo "File does not exist.You have tried 3 times!"
        echo "Please run the program again!Goodbye.."
        exit 1 
 fi

}


ReadFilePermMsg() {

        echo
	echo "Enter the file permission you would like to have for the file :"
        echo 
	echo "********************************"
        echo "a sample format is : rwxr-xr--"
        echo "********************************"
}



FilePermissionCheck() {

echo
#reading the File Permission from user indicaing proper format 

read filePermission


#Regular Expression for the filePermission format
RegEx='^([r-][w-][x-]){3}$'

for i in {1..3}
do

#checking if user entered an empty value as input 
# if empty, read filepermission again!

if [[ -z "$filePermission" ]]
   then
       if ! (( $i == 3 ))
         then
               echo "The file permission you entered is blank!" 
               ReadFilePermMsg
               read filePermission
               
       fi
       continue
fi


#Eliminate any spaces in the permission that user have entered 
 
filePermission=$(echo "$filePermission" | sed -e 's/ *//g')


if ! [[ $filePermission =~  $RegEx ]]
   then
        echo "The file permission that you entered is not in valid format !"

        if (( $i != 3))
           then
                echo "Please Enter the permission again!"
                read filePermission

                #Eliminate the spaces that user entered in between filepermission 
                filePermission=$(echo "$filePermission" | sed -e 's/ *//g')

        fi
   else
        return 2
fi
done

if (( $i == 3 ))
  then
      echo "You have tried 3 times!" 
      echo "Please run the program again!!Goodbye..."
      exit 4 
fi

}


#converting to octal

OctalConversion() {

echo $filePermission $fileName |

#echo "ibase=2; obase=8; $filePermission" | bc
#     is another method to perform below operation

awk '{ 
       gsub("r","4",$1);
       gsub("w","2",$1);
       gsub("x","1",$1);
       gsub("-","0",$1); 
       sum = 0 ;
       octalValue= "";
       for(i=1;i<10;i++)
          {
             sum += substr($1,i,1);
             if(i % 3 == 0) 
                {
                   octalValue=octalValue""sum; 
                   sum=0 ;
                }
              
          }
      };
END { print "\nTo change file permission you can enter the below command -";
      printf "\nchmod %d ", octalValue ; print $2;
      printf "\n"; 
    }'

}

#Processing of the  whole program starts here 

ReadFileName
FileNameProcess
if (($? == 1))
  then
      echo
      echo "Thank you.The file you entered exists!"
      echo "Info on the file is :" 
      echo 
      ls -l $fileName
      echo 
      ReadFilePermMsg
      FilePermissionCheck
      if (($? == 2))
         then
             echo
             echo  "Permission format you entered is good!"
             OctalConversion
       fi
fi

echo
echo "*****End of the program*******" 
echo
