#!/bin/bash

infile="alice.txt"

count=0

while read line;do
    count=$(grep -io the alice.txt | wc -l)
done < $infile

echo "The amount of the's in alice.txt is $count"
