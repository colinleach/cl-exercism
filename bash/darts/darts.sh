#!/usr/bin/env bash

# The following comments should help you get started:
# - Bash is flexible. You may use functions or write a "raw" script.
#
# - Complex code can be made easier to read by breaking it up
#   into functions, however this is sometimes overkill in bash.
#
# - You can find links about good style and other resources
#   for Bash in './README.md'. It came with this exercise.
#
#   Example:
#   # other functions here
#   # ...
#   # ...
#
#   main () {
#     # your main function code here
#   }
#
#   # call main with all of the positional arguments
#   main "$@"
#
# *** PLEASE REMOVE THESE COMMENTS BEFORE SUBMITTING YOUR SOLUTION ***

x=$1
y=$2
r_sq=x*x+y*y

if [[ $r_sq -le 1 ]]; then
    score=10
elif [[ $r_sq -le 25 ]]; then
    score=5
elif [[ $r_sq -le 100 ]]; then
    score=1
else 
    score=0
fi

echo $score
