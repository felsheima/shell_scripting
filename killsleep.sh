#!/bin/bash

$(sleep 30) &
sleeppid=$!

$(sleep 60) &
sleeppid2=$!

echo "First sleeping pid is $sleeppid"
echo "Second sleeping pid is $sleeppid2"

sleep 2

kill $sleeppid
sleep 1 #Pause process since it is too fast and executes the result before it kills it 
kill -0 $sleeppid2
result1=$?
kill -0 $sleeppid
result2=$?


echo $result1 $result2  
