#!/bin/bash

#Get input from the user regarding student information and marks, 
#then validate and display the results.

checkStudentInfoParameters() {
	
	echo "*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "*Welcome to the marks program"
	echo "*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "*"
	echo "*Please enter the student info : "
	echo "*(first name last name student number(6 digit integer))"
	echo "*Please note : first name and last name 
	      Start with First letter Capital and rest small letters"
	echo "*****************************************"
	echo "*sample format is : "
	echo "*Ann Frank 678935"
	echo "*************************************"
	echo "*"

#read the student info
#Here we make sure that user has entered 3 course codes
#if not prompt user to input 3 values 
#After 3 attempt exi from the program

   	read -a studentArray
	echo "Checking the number of paramteres you entered...."

	for i in {1..3}
   	   do 
          	if ! (( ${#studentArray[@]} == 3 ))

          	   then 
			echo
                	echo "*Number of paramters invalid! Enter all 3 info. "
                	if (( $i != 3 ))
                  	   then 
                      		echo "*Please enter student details again"
                      		read -a studentArray
                 	fi
          	elif (( ${#studentArray[@]} == 3 )) 
              	     then 
                  	echo "*Student info contain correct parameters!"        
             	        return 1 

        	fi 
        done
        if (( $i == 3 ))
            then
		 echo
		 echo  "****************goodbye*******************************"
                 echo  "*You have tried entering the details 3 times!!"
		 echo  "*Check the formats!"
		 echo  "*Please run the program again!"
		 echo  "****************goodbye*******************************"
                 exit 1
   
         fi 
        
}


#defines all the regular expressions used for this program
initStudentRegularExpression() {

	firstNameRegEx='^[A-Z][a-z]+$'
	lastNameRegEx='^[A-Z][a-z]+$'
	studentNumberRegEx='^[0-9]{6}$'

}


#evaluating the studentarray 
#exract each parts and set a boolean variable if it matches the 
#regular expression 

evaluateArray() {

        [[ ${studentArray[@]:0:1} =~ $firstNameRegEx ]]&&isFirstNameOk=0||isFnameOK=1
        [[ ${studentArray[@]:1:1} =~ $lastNameRegEx ]]&&isLastNameOk=0||isLnameOK=1
        [[ ${studentArray[@]:2:1} =~ $studentNumberRegEx ]]&&isStudentNumberOk=0||isStudentNumberOk=1
}

stuInfoValidation() {

#Check if the user entered data matches with the regular expression
#if not valid format get the ifo again 
#After getting invalid date 3 times exit the program

	initStudentRegularExpression
	
	echo "Validating the student info...."

	for i in {1..3}
   	  do
        	evaluateArray
        	if ((isFirstNameOk == 0 && isLastNameOk == 0 && isStudentNumberOk == 0 ))
          	   then 
			echo
              		echo "*Thank you! Student info is vaild!"
              		return 2
        	else 
            		if  (( isFirstNameOk > 0 ))
              		    then
                		echo "*First name is not valid!Please check all 3 student detail formats"
             		elif (( isLastNameOk > 0 ))
                	     then 
                		echo "*Last name is not valid!Please check all 3 student detail formats"
                                
             		elif (( isStudentNumberOk > 0 ))
                	    then
                		echo "*student number is not valid!Please check all 3 student detail formats"
             		fi
         	fi
       		if ! (( $i == 3 ))
           	   then 
                	echo "*You have to enter the student details again :"
              		read -a studentArray
       		fi
 	done
        if (( $i == 3 ))
            then
		 echo
		 echo  "****************goodbye*******************************"
                 echo  "*You have tried entering the details 3 times!!"
		 echo  "*Check the formats!"
		 echo  "*Please run the program again!"
		 echo  "****************goodbye*******************************"
                 exit 2

            fi

}

checkCourseCodeParameters() {

#get 3 course code value from user
#sample format is shown in the output 
        
	echo 
	echo "###########################################" 
	echo "*Please enter 3 course codes : "
	echo "* Course code Format: First 3 uppercase alpha, next 3 numbers" 
	echo "*****************************************"
	echo "*sample format is : "
	echo "*ULI705 ORA725 SQL715"
	echo "*************************************"
	echo
	read -a courseArray
	echo "Checking the number of paramteres that you entered..."


#Here we make sure that user has entered 3 course codes
#if not prompt user to input 3 values 
#After 3 attempt exit from the program

	for i in {1..3}
   	   do
           if ! (( ${#courseArray[@]} == 3 ))
          	then
			echo
                	echo "*Number of paramters are invalid! You have to enter 3 cousr codes. "
                	if (( $i != 3 ))
                  	   then
                             	echo "*please enter the course codes again!"
                      		read -a courseArray
                        fi
           elif (( ${#courseArray[@]} == 3 ))
                then
                      echo "*You have entered the correct number of course codes!"        
                     return 3 
           fi

        done
        if (( $i == 3 ))
            then
		 echo 
		 echo  "****************goodbye*******************************"
                 echo  "*You have made 3 attempts to enter input!!"
		 echo  "*Check the number of inputs and formats!"
		 echo  "*Please run the program again!"
		 echo  "****************goodbye*******************************"
                 exit 3

            fi
}


validateCourseCodes(){


#regular expression used for course code validation 
	courseCodeRegEx='^([A-Z]){3}([0-9]){3}$'

#Here we make sure that course codes entered by user are valid format
#if not prompt user to input values with correct format
#After 3 attempts exit from the program

	echo "Validating the course codes that you entered..."
	for i in {1..3}
	   do
     		ccounter=0

       		for index in ${!courseArray[*]}
                   do
               		if ! [[ ${courseArray[$index]} =~ $courseCodeRegEx ]]
                 	   then 
				echo
                                echo "*Invalid input!You have to enter all 3 code names with proper format "
                                if ! (( $i == 3 ))
                                   then
                                       echo "*Please enter the course codes again!"             
                                       read -a courseArray
                                       break
                                fi
       
                	else
                        	((ccounter=ccounter+1))
              		fi
       		done
   
	        if (( $ccounter == 3))
                   then 
        	 	echo " Thank you!All the course code are valid"
        		return 4
	   fi

	done

      	if (($i == 3 ))
            then
		 echo
		 echo  "****************goodbye*******************************"
                 echo  "*You have made 3 attempts to enter input!!"
		 echo  "*Check the number of inputs and formats!"
		 echo  "*Please run the program again!"
		 echo  "****************goodbye*******************************"
                 exit 4
        fi

}


#Get the resective marks for the courses that user entered from user
#Make sure taht user has entered 3 marks 

checkMarksParameters() {

#get respective  marks for the course codes from user
#sample format is shown in the output
#if not prompt user to input 3 values 
#After 3 attempts exit from the program

        echo
        echo "###########################################" 
        echo "*Please enter the respective marks for the above course codes:"
        echo "*0 to 100 only. Marks can be integers or could have one decimal place"
        echo "*****************************************"
        echo "*sample format is : "
        echo "*88 12.3 100"
        echo "*************************************"
        echo

        read -a marksArray
	echo "Checking the number of paramteres that you entered..."

        for i in {1..3}
           do
           if ! (( ${#marksArray[@]}== 3 ))
                then
			echo 
                        echo "*Number of paramters are invalid!You have to enter 3 marks. "
                        if (( $i != 3 ))
                           then
                                echo "*please enter the marks  again!"
                                read -a marksArray
                        fi
           elif (( ${#marksArray[@]} == 3 ))
                then
                      echo "*You have entered the correct number of marks!"        
                     return 5
           fi

        done
        if (( $i == 3 ))
            then
                 echo 
                 echo  "****************goodbye*******************************"
                 echo  "*You have made 3 attempts to enter input!!"
                 echo  "*Check the number of inputs and formats!"
                 echo  "*Please run the program again!"
                 echo  "****************goodbye*******************************"
                 exit 5

            fi
}


#Below function validates the marks entered by user
#After 3 attempt exit from the program
validateMarks() {


#regular expression that used to validate the marks
	studentMarksRegularExpression='^(100(\.[0])?|0[0-9]{1,2}(\.[0-9])?|[0-9]{1,2}(\.[0-9])?)$'

echo "Validating the marks format..."
#Here we make sure that course codes entered by usedr are valid format
#if not prompt user to input values with correct format
#After 3 attempts exit from the program
	for i in {1..3}
	  do
#A counter set for getting the number of marks that are valid  
	     mCounter=0

       	     for index in ${!marksArray[*]}
               do
             	     newStudentMarkss=$(echo "${marksArray[$index]}" | awk '{printf "%.1f\n",$0;}' FS='.')
               	     if ! [[ $newStudentMarkss =~ $studentMarksRegularExpression ]]
                        then 
                              echo "*Your input is not in valid format!"   
			      
				if ! (( $i == 3 ))
                                   then
				       echo
                                       echo "*Please enter marks again please"
                                       read -a marksArray
                                       break
                                fi
       
                      else
                              ((mCounter=mCounter+1))
 
                      fi
             done

	     if (( $mCounter == 3))
        	then 
	            echo		
        	    echo "*Thank you! Marks you entered are valid"
       		    return 6 
             fi

         done
      	 if (($i == 3 ))
            then
		 echo
		 echo  "****************goodbye*******************************"
                 echo  "*You have made 3 attempts to enter input!!"
		 echo  "*Check the number of inputs and formats!"
		 echo  "*Please run the program again!"
		 echo  "****************goodbye*******************************"
                 exit 6
         fi

}


#below function compares the marks entered by user
#get the highest mark from the lot and 
#show the corresponding course(s) that the student got highest mark for 

getHighestMark() {

	highestMark=0
	length=${#marksArray[*]}
	index=0

#Comparing the float value marks using BC 
#To strip off the leading zeroes (if any) from mark that user entered  

	while [ $index -lt $length ]
	   do

		newStudentMarks=$(echo "${marksArray[$index]}" | awk '{printf "%.1f",$0;}' FS='.')
        	
		if [ $(echo "$highestMark < $newStudentMarks"|bc) -eq 1 ]
           	  then
               		highestMark=$newStudentMarks
        	fi
        	((index=index+1))
	done

#Outputs the course(s) having highest marks(s)
	newIndex=0

	while [ $newIndex -lt $length ]
	   do
        	newStudentMarks=$(echo "${marksArray[$newIndex]}" | awk '{printf "%.1f",$0;}' FS='.')
        	
		if [ "$newStudentMarks" == "$highestMark" ]
           	   then 
                	echo "*You have the highest mark(s) in course(s): ${courseArray[$newIndex]}"
			echo
        	fi
        	((newIndex=newIndex+1))

 	done 

}


#*************************************************************************
# Program processing starts here
#*************************************************************************

	checkStudentInfoParameters
	if (($? == 1 ))
	   then
		stuInfoValidation
	        if (($? == 2))
		   then
			checkCourseCodeParameters
			if (($? == 3))
			  then 
			      validateCourseCodes
			      if (($? == 4 ))
				then
				     checkMarksParameters
					if (($? == 5 ))
				          then		
					      validateMarks
				     		if (($? == 6))
						  then 
					     		getHighestMark
						fi
				        fi
			       fi	
			fi	
	        fi
	fi



echo "**********************Thank you************************************"
echo "Authors : Anaswara Naderi Vadakkeperatta "
echo "          Jayna Dave"
echo "######################End of the Program#############################"

