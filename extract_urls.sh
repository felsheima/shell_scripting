#!/bin/bash

#Create a shell script that uses the DU json file, json.tools, sed OR awk OR cut to parse out just the URL
file="du.json"

while read line; do
    url=$(echo "$line" | python3 -m json.tool | grep '"url"' | awk -F '"' '{print $4}')
    status=$(echo "$line" | python3 -m json.tool | grep '"status"' | awk -F '"' '{print $4}')

    echo "URL: $url"
    echo "Status: $status"
done < "$file" 

