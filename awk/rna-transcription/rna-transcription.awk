{
    split($01, seq, "")
    for (i=1; i <= length($0); i++) {
        if (seq[i] == "G") result = result "C"
        else if (seq[i] == "C") result = result "G"
        else if (seq[i] == "T") result = result "A"
        else if (seq[i] == "A") result = result "U"
        else {
            print "Invalid nucleotide detected."
            exit 1
        }
    }
    print result
}