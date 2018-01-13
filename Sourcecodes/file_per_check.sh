#!/bin/bash

re='^([r-][w-][x-]){3}$'

echo "enter parametr"
read myVar

if ! [[ $myVar =~  $re ]]
   then 
	echo "name is invalid $myVar"
   else
        echo  "good"
fi
