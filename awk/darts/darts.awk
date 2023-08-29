# BEGIN {
#     print "Implement this solution" > "/dev/stderr"
#     exit 1
# }

{
    r = sqrt($1^2 + $2^2)
    if (r <= 1) {
        print 10
    }
    else if (r <= 5) {
        print 5
    }
    else if (r <= 10) {
        print 1
    }
    else {
        print 0
    }
}