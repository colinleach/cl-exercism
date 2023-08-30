{
    c = ""
    sum = 0

    # only digits and spaces
    if ( $0 ~ /[^0-9 ]+/ ) {
        print "false"
        exit
    }
    # reverse and strip spaces
    for (i=length($0); i!=0; i--) {
        chr = substr($0, i, 1)
        if (chr != " ") num = num chr
    }
    # at least 2 digits
    if ( length(num) < 2 ) {
        print "false"
        exit
    }
    # double alternate digits
    for (i=1; i<=length(num); i++) {
        digit = substr(num, i, 1)
        if (i % 2 == 0) digit = (digit < 5) ? 2 * digit : 2 * digit - 9
        sum += digit
    }

    print (sum % 10 == 0) ? "true" : "false"
}
