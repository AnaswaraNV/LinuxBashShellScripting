#!/bin/bash

RegEx=[[:space:]]

echo "enter value"
read input 

if [[ $input =~ [:space:] ]]
  then
	echo "matches"
  else 
        echo "does not match"
fi 

