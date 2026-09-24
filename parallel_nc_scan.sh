#!/bin/bash

#Number of scans to run at the same time
scans=10

#Generate IP addresses 
for i in {1..5}; do
    #Generate an nc command for each IP and scan ports 20-25
    echo "nc -zv 192.168.1.$i 20-25"
done | parallel -j "$scans"
 
