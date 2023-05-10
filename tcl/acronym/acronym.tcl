proc abbreviate {phrase} {
    set words [split [string toupper $phrase] "- "]
    set abbrev ""
    foreach word $words {
		if {[regexp {[A-Z]} $word letter] > 0} {
			set abbrev $abbrev$letter
		}
	}
	return $abbrev
}
