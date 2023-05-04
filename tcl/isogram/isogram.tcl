proc isIsogram {input} {
    if {$input eq ""} { return 1 }
    set letters [split [string tolower $input] {}]
    set letters [lsort [lsearch -inline -all -not -exact -regexp $letters {[ -]}]]
    foreach a [lrange $letters 0 end-1] b [lrange $letters 1 end] {
		if {$a == $b} {return 0}
	}
    return 1
}
