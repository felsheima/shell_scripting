#!/bin/bash

num=$1

for i in {1..100..3}; do
    printf "%02${num}d\n" "$i"
done
