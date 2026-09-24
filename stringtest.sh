#!/bin/bash

first=$1
first_length=${#first}

second=$2
second_length=${#second}

if [[ $# -ge 2 ]]; then #Checking if the inputed arguments is at least 2
    echo "Enough arguments"
else
    exit 1
fi
    
if [[ ! -n "$1" ]]; then #Checking if argument 1 is null 
    echo "Commands need to be greater than Null!"
    exit 2
fi

if [[ ! -n "$2" ]]; then #Checking if argument 2 is null
    echo "Commands need to be greater than Null!"
    exit 2
fi
    
if [[ "$first" == "$second" ]]; then
    exit 0
elif
    [[ "$first" > "$second" ]]; then
    echo "The length of $first is $first_length"
else
    echo "The length of $second is $second_length"
fi
    
