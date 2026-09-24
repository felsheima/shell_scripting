#!/bin/bash

x=3
y=4
z=10

if [[ "$x" -gt "6" ]] && [[ "$y" -lt 3 ]] || [[ "$z" -eq 10 ]]; then
    echo "$x less than 6, $y greater than 3"
    echo "Or $z is exactly 10"
fi
