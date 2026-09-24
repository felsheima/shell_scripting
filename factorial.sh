#!/bin/bash

factorial() {
    # Base case
    if [ "$1" -le 1 ]; then
        echo 1
    else
        # Recursive case
        previous=$(factorial $(( $1 - 1 )))
        echo $(( $1 * previous ))
    fi
}

FACTORIAL_RESULT=$(factorial 10)

echo "The factorial of 10 is $FACTORIAL_RESULT"
