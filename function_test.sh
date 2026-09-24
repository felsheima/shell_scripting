#!/bin/bash

function add {
    result=$(($1 + $2))
    echo $result
}

function multiply {
    result1=$(($1 * $2))
    echo $result1
}

ADDING_RESULT=$(add 50 23)
MULTIPLY_RESULT=$(multiply 23 32)

echo "The result of adding is $ADDING_RESULT"
echo "The result of multiplying is $MULTIPLY_RESULT"
