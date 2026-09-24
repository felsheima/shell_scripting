#!/bin/bash

first_arg=$1
second_arg=$2
third_arg=$3
fourth_arg=$4
fifth_arg=$5

if [[ $# -lt 3 ]]; then #if arguments are less than 3
    echo "Arguments cannot be less than three! Try again!"
    exit 1
fi

if [[ $# -gt 5 ]]; then #if arguments are greater than 5
    echo "Arguments cannot be greater than five! Try again!"
    exit 2
fi

total=1
for i in "$@"; do #@ is for all arguments 
    total=$((total * i))
done

echo "Multiplied value of all the arguments provided are $total"
