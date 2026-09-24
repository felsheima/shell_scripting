#!/bin/bash

#Splicing a variable and starting at index 5 and ending in 9 to get the word heart 

VAR="braveheart"

echo ${VAR:5:9}

#Length of a variable

length=${#VAR}

echo "The length of $VAR is $length"

