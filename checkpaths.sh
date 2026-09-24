#!/bin/bash

for f in /etc/{skel,network,host{s,""},resolv.conf,passwd,shadow}; do
    if [[ -f "$f" ]]; then
	echo "$f is a file"
    elif
	[[ -d "$f" ]]; then
	echo "$f is a directory"
    elif
	[[ ! -e "$f" ]]; then
	echo "$f is non-existent"
    else
	echo "$f exists, but neither a file nor a directory" 
    fi
done
    
