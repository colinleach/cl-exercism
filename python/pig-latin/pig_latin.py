import re

def pigword(word):
    # Rule 1
    if (re.match(r"^[aeiou]", word) or
            word.startswith("xr") or word.startswith("yt")):
        return word + "ay"

    # Rule 3
    m = re.match(r"^([^aeiou]*qu)(.*)", word)
    if m:
        return m.group(2) + m.group(1) + "ay"

    # Rules 2 and 4
    m = re.match(r"^([^aeiou]+)([aeiouy].*)", word)
    if m:
        return m.group(2) + m.group(1) + "ay"


def translate(text):
    return " ".join([pigword(w) for w in text.split()])

