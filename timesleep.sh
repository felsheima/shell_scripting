#!/bin/bash

the_date=$(date +%s)
echo $the_date

sleep 10

second_date=$(date +%s)
echo $second_date

difference=$(($second_date - $the_date))

echo "Sleep slept for $difference seconds"
