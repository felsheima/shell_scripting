#!/bin/bash

#Script to output the length and variable offset

GAR="gargantuan"

OFFSET=${GAR:4:3}

length=${#GAR}"_"${#OFFSET}

echo "The length of $GAR and $OFFSET is $length"
echo "The variables are $OFFSET and $GAR" 
