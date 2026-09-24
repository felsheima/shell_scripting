#!/bin/bash

declare -A scores

scores["Alice Charles"]=95
scores["Bob Alicia"]=82
scores["Charlie Roberts"]=91

name="DU Score report"

function print_score() {
    name=$1

    echo "Student: $name"
    echo "Score: ${scores[$name]}"
}

echo "BEGIN $name"

for student in "${!scores[@]}"; do
    print_score "$student" 
done

echo "END $name"
