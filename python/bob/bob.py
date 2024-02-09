import re


def response(hey_bob):
    def is_empty(input):
        return not re.search(r"\S", input)
    
    def is_upper(input):
        return re.search(r"[A-Z]", input) and not re.search(r"[a-z]", input) 
    
    def is_question(input):
        return re.search(r"\?\s*$", input)

    if is_empty(hey_bob):
        return "Fine. Be that way!"

    if is_upper(hey_bob):
        if is_question(hey_bob):
            resp = "Calm down, I know what I'm doing!"
        else:
            resp = "Whoa, chill out!"
    else:
        if is_question(hey_bob):
            resp = "Sure."
        else:
            resp = "Whatever."
    return resp
