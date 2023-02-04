#!/usr/bin/env bash
set -f
WORDS=$(echo $1 | tr -cd '[:alnum:][:space:]-' | tr -s [:space:] '\n' | tr '-' '\n' | tr a-z A-Z )
RESULT=""
for w in $WORDS
do
 RESULT="$RESULT${w:0:1}"
done
echo $RESULT