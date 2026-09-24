#!/bin/bash

awk -F ',' '{ print NF } END {print "Total lines:", NR }' < more_interesting_data.csv

cat more_interesting_data.csv | awk -F ',' '{ print $1 }'
