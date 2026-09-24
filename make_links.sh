#!/bin/bash

#Check to make sure 2 command line arguments were prvoided 
if [[ "$#" -ne 2 ]]; then
    echo "That is not correct, use ./filename make_links.sh NUMBER FILE"
    exit 1
fi

#Store the arguments into variables 
number=$1
file=$2

#Debugging
#echo "Number: $number"
#echo "File: $file"

#Create the array 
links=()

#((START; CONDITION; INCREMENT))
for ((i=1; i<=number; i++)); do
    link=$(mktemp -u) #Creates unique names for your links, -u generates the name without actually creating the file 
    ln "$file" "$link" #Creates a hard link from the original file to the temporary file
    links+=("$link") #Saves the link name so it can be deleted after counting 
done

#Get the number of hard links to the original file 
link_count=$(ls -l "$file" | awk '{print $2}')
echo "Number of hard links: $link_count"

#Loop through every temporary link created and rm the hard link 
for link in "${links[@]}"; do
    rm "$link"
done
