# These variables are initialized on the command line (using '-v'):
# -direction

BEGIN {
    letters =  "abcdefghijklmnopqrstuvwxyz"
    split("0123456789", digits, "")
}

{
    split(tolower($0), input, "")
    output = ""
    copied = 0 # keep track of need for space after every 5th character
    for (i=1; i<=length(input); i++) {
        char = input[i]
        if (char in digits) { # digits unchanged
            output = output char
            copied++
        }
        else {
            inx = index(letters, char)
            if (inx > 0) { # letters coded, other characters ignored
                output = output substr(letters, 27-inx, 1)
                copied++
            }
        }
        if (direction == "encode" && copied == 5 && i < length(input)) {
            output = output " "
            copied = 0
        }
    }
    sub(/ $/, "", output) # get rid of any trailing space
    print output
}
