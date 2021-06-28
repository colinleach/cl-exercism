package bob

import (
	"regexp"
	"strings"
)

// Hey should have a comment documenting it.
func Hey(remark string) string {
	nonWhitespace, _ := regexp.MatchString("[^\t\n\f\r ]", remark)
	if !nonWhitespace {
		return "Fine. Be that way!"
	}

	remark = strings.Trim(remark, " ")
	hasUpper, _ := regexp.MatchString("[A-Z]", remark)
	hasLower, _ := regexp.MatchString("[a-z]", remark)
	isUpper := hasUpper && !hasLower
	isQuestion := remark[len(remark)-1] == '?'

	var resp string
	if isUpper {
		if isQuestion {
			resp = "Calm down, I know what I'm doing!"
		} else {
			resp = "Whoa, chill out!"
		}
	} else {
		if isQuestion {
			resp = "Sure."
		} else {
			resp = "Whatever."
		}
	}
	return resp
}
