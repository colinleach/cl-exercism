import string
alph = list(string.ascii_lowercase)
transdict = dict(zip(alph, alph[::-1]))


def encode(plain_text):
    cleaned = ''.join(plain_text.lower().split())
    ciphered = "".join(translate(cleaned))
    return " ".join(split5([], ciphered))


def decode(ciphered_text):
    return "".join(translate(ciphered_text.replace(" ", "")))


def translate(input):
    def transchar(c):
        if c in alph:
            return transdict[c]
        if c.isdigit():
            return c
        return ""
    return [transchar(c) for c in input]


def split5(bits, rest):
    if rest == "":
        return bits
    if len(rest) <= 5:
        bits.append("".join(rest))
        return bits
    bits.append(rest[:5])
    return split5(bits, rest[5:])
