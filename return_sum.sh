#!/bin/bash

VALUE1=$1
VALUE2=$2

ADD=$((VALUE1 + VALUE2))

exit $ADD

#Or you can do it this way

exit $(($1 + $2))
