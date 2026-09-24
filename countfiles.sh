#!/bin/bash

for file in *; do
    if [[ -f $file ]]; then
	((count++))
    fi
done

if [[ $count -gt 10 ]]; then
    echo "There are more than 10 files"
elif
    [[ $count -lt 10 ]]; then
    echo "There are less than 10 files"
elif
    [[ $count -eq 10 ]]; then
    echo "There are exactly ten. Correct number of files found"
fi

echo "The total files is $count"	
    
