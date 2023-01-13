{if (NF > 0) print "One for "$0", one for me."}
END { if (NF > 0) exit 0
    print "One for you, one for me."}