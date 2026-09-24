#!/bin/bash

filename=$1
delimiter=$2
column_number=$3
count=0
sum=0
highest_score=0
lowest_score=101
highest_name=""
lowest_name=""

for line in $(tail -n +2 "$filename"); do
    grade=$(echo "$line" | cut -d "$delimiter" -f "$column_number")
    student_name=$(echo "$line" | cut -d "$delimiter" -f 1)
    ((count++))
    sum=$(($sum + $grade))

    if [[ $grade -gt $highest_score ]]; then
	highest_score=$grade
	highest_name=$student_name 
    fi

    if [[ $grade -lt $lowest_score ]]; then
	lowest_score=$grade
	lowest_name=$student_name
    fi
    
done

mean=$(echo "scale=2;$sum/$count" | bc)

echo "The mean value of scores is $mean with the highest being $highest_score assigned to $highest_name and the lowest being $lowest_score assigned to $lowest_name"  
