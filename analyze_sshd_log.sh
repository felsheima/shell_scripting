#!/bin/bash

echo "How many total connection attempts failed because of an invalid user name?"
#Question 1
question1=$(grep -c "Invalid user" "$1")

echo "Distinct user name count is $question1"

echo

echo "What are the distinct user names attempted that failed to login to the system?"
#Question 1.1
question2=$(sed -n 's/.*Invalid user \([^ ]*\).*/\1/p' "$1" | sort -u)

echo "Distinct user names found are $question2"

echo

echo "What are the distinct IP address that tried to log in with an invalid user name?"
#Question 1.2
question3=$(sed -n 's/.*Failed password for invalid user [^ ]* from \([^ ]*\).*/\1/p' "$1" | sort -u)

echo "Distinct IP addresses from invalid user names are $question3"

echo

echo "How many times was each IP address seen in the file?"
#Question 1.3
question4=$(grep "Failed password for invalid user" "$1" | sed -n -r 's/^.*Failed password for invalid user [A-Za-z0-9_-]+ from ([0-9.]+) port .*/\1/p' | sort | uniq -c | sort -nr)

echo "Each IP was seen $question4 times in the file" 

echo

echo "How many connection attempts failed during the 'kex_exchange_identification' phase?"
#Question 2
question5=$(sed -n '/kex_exchange_identification/p' "$1" | wc -l)     

echo "$question5 connnection attempts"

echo

echo "Of the 'kex_exchange_identification' errors, how many of them contain the specific error 'Connection closed by remote host'?"
#Question 2.1
question6=$(sed -n '/kex_exchange_identification/p' "$1" | sed -n '/Connection closed by remote host/p' | wc -l)

echo "$question6 contain the specific error 'Connection closed by remote host'"

echo

echo "How many of them contain a different error than 'Connection closed by remote host'?"
#Question 2.2
question7=$(sed -n '/kex_exchange_identification/p' "$1" | sed '/Connection closed by remote host/d' | wc -l)

echo "$question7 contain a different error than 'Connection closed by remote host'"

echo

echo "List out all the distinct errors from the previous answer?"
#Question 2.3
question8=$(sed -n '/kex_exchange_identification/p' "$1" | sed '/COnnection closed by remote host/d' | sed 's/.*kex_exchange_identification: //' | sort -u)

echo "$question8"

echo

echo "How many login attempts fail due to an incorrect username but not in the preauth phase?"
#Question 3
question9=$(sed -n '/Failed password for invalid user/ { /preauth/!p}' "$1" | wc -l)

echo "$question9 login attempts failed due to an incorrect username"

echo

echo "List out the distinct user names that are attempted here?"
#Question 3.1
question10=$(sed -n '/Failed password for invalid user/ { /preauth/!p }' "$1" | sed 's/.*Failed password for invalid user \([^ ]*\).*/\1/' | sort -u)

echo "$question10"

echo "List out the distinct IP addreses that are attempting to login here (how many attackers are there)?"
#Question 3.2
question11=$(sed -n '/Failed password for invalid user/ { /preauth/!p }' "$1" | sed 's/.* from \([^ ]*\).*/\1/' | sort -u)

echo "$question11"

echo "Number of attackers: $(echo "$question11" | wc -l)"

echo 

echo "How many times does the error 'invalid protocol identifier' occur?"
#Question 4
question12=$(grep "invalid protocol identifier" "$1" | wc -l)

echo "The error occurred $question12 times."
	     
echo

echo "List out the distinct invalid identifiers that are used?"
#Question 4.1
question13=$(grep "invalid protocol identifier" "$1" | sed -n -r 's/^.*invalid protocol identifier "(.*)"/\1/p' | sort | uniq)

echo "$question13"

echo

echo "How many successful logins are shown in the log file?"
#Question 5
question14=$(grep "Accepted" "$1" | wc -l)

echo "$question14 successful logins"

echo

echo "What are you able to search for to find successful logins?"
#Question 5.1
question15=$(grep -E "Accepted (password|key|publickey)" "$1")

echo "$question15"

echo

echo " How many distinct users are there that succesfully logged into this system?"
#Question 5.2
question16=$(grep "Accepted" "$1" | sed -n -r 's/^.*Accepted [A-Za-z]+ for ([A-Za-z0-9_-]+) from .*/\1/p' | sort | uniq | wc -l)

echo "$question16 distinct users that successfully logged into this system."

echo

echo "What are the user names of the users that logged into the system?"
#Question 5.3
question17=$(grep "Accepted" "$1" | sed -n -r 's/^.*Accepted [A-Za-z]+ for ([A-Za-z0-9_-]+) from .*/\1/p' | sort | uniq)

echo "$question17"

echo

echo "What IP addresses did the users log in from?"
#Question 5.4
question18=$(grep "Accepted" "$1" | sed -n -r 's/^.*Accepted [A-Za-z]+ for [A-Za-z0-9_-]+ from ([0-9.]+) port .*/\1/p' | sort)

echo "$question18"

echo

#Question 5.5
echo "Explanation of the script is in a comment under Question 5.5"
echo "Checking whether any attacker IPs also successfully logged in:"

grep "Failed password for invalid user" "$1" | sed -n -r 's/^.*Failed password for invalid user [A-Za-z0-9_-]+ from ([0-9.]+) port .*/\1/p' | sort | uniq > attacker_ips.tmp

grep "Accepted" "$1" | sed -n -r 's/^.*Accepted [A-Za-z]+ for [A-Za-z0-9_-]+ from ([0-9.]+) port .*/\1/p' | sort | uniq > successful_ips.tmp

matches=$(grep -Fxf attacker_ips.tmp successful_ips.tmp)

if [[ -n "$matches" ]]; then
    echo "An attack may have succeeded. These attacker IPs match IPs from successful logins:"
    echo "$matches"
else
    echo "There is no evidence that the observed attacker IPs successfully logged in. None of the invalid-user attack IPs match the successful-login IPs."
fi

rm attacker_ips.tmp successful_ips.tmp
