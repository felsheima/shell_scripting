#!/bin/bash

echo "80104" | sed 's/[0-9][0-9][0-9][0-9][0-9]/ZIP_MATCHED/'

echo "309-519-3123" | sed -r 's/[0-9]{3}-[0-9]{3}-[0-9]{4}/PHONE_MATCHED/'

echo "Ally" | sed 's/^[A-Z][a-z]\+/NAME_MATCHED/'

echo "192.168.2.145" | sed -E 's/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/IP_MATCHED/'

echo "https://www.google.com" | sed 's#https://www\.[a-z]*\.com#WEBSITE_MATCHED#'
