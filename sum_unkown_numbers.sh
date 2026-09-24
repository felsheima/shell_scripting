#!/bin/bash

sum=0
original_args="$@" # $@ takes in however many arguments 

while [[ "$#" -gt 0 ]]; do # $# total number of arguments passed 
    sum=$(echo "scale=3;$sum +$1" | bc)
    shift
done

echo "The sum of $original_args is $sum"  
