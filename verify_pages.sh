#!/bin/bash

while read line; do
    
        url=$(echo "$line" | jq -r ".url")
	status=$(echo "$line" | jq -r ".status")
	
	curl_status=$(curl -L -s -w '%{http_code}\n' "$url" -o /dev/null)

	if [[ "$status" -ne "$curl_status" ]]; then
	    echo "Status is different than $url"
	fi
done


