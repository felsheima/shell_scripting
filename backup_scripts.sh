#!/bin/bash

#Create a shell script that finds, backs up, and compresses with xz all.sh files under the current directory (recursively)

#tar cf shell_scripts.tar verify_pages.sh sleeper.sh sed_tests.tar
#find ./ .iname '*sh'

find . -iname '*.sh' | xargs tar cf shell_scripts.tar

xz shell_scripts.tar 

