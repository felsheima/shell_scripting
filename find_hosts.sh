#!/bin/bash

#user passes in 8.8.8

subnet_base=$1

function pingAndPrint() {
    #Take in an IP address
    #Print wheter or not it responds to ping
    host=$1
    
    ping -c1 -W5 "$host" 2>/dev/null 1>/dev/null
    ret=$?
    
    if [[ "$ret" -eq "0" ]]; then
	echo "Host $host is alive!"
    fi
    
}

for i in {1..255}; do
    pingAndPrint "$subnet_base.$i" &
done

wait
