#!/bin/bash

FIRST_ARG=$1
SECOND_ARG=$2

if [[ "$SECOND_ARG" == *"$FIRST_ARG"* ]]; then
    echo "$FIRST_ARG is a substring of $SECOND_ARG"
else
    echo "$FIRST_ARG is not a substring of $SECOND_ARG"
fi
