def encode(string):
    def to_append():
        num = str(count) if count > 1 else ""
        return "" if prev_char is None else num + prev_char

    if not string:
        return ""

    prev_char = None
    count = 1
    out = ""
    for char in string:
        if char == prev_char:
            count += 1
        else:
            out += to_append()
            prev_char = char
            count = 1
    return out + to_append()


def decode(string):
    number = ""
    out = ""
    for char in string:
        if char.isdigit():
            number += char
        else:
            repeats = int(number) if number else 1
            out += repeats * char
            number = ""
    return out

