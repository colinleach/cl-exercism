# These variables are initialized on the command line (using '-v'):
# - num

BEGIN {
    if (num % 3 == 0) result = result "Pling";
    if (num % 5 == 0) result = result "Plang";
    if (num % 7 == 0) result = result "Plong";
    print (length(result) > 0 ? result : num)
}