from string import ascii_lowercase

alph = ascii_lowercase
digits = '0123456789'
m = 26
m_factors = (2, 13)

def encode(plain_text, a, b):
    if any([a % n == 0 for n in m_factors]):
        raise ValueError("a and m must be coprime.")

    def encode_char(c):
        if c in digits:
            return c
        if c in alph:
            return alph[(alph.index(c) * a + b) % m]
        return ""

    ciphered = ''.join(map(encode_char, plain_text.lower()))
    return " ".join(split5([], ciphered))


def decode(ciphered_text, a, b):
    if any([a % n == 0 for n in m_factors]):
        raise ValueError("a and m must be coprime.")

    return None

def split5(bits, rest):
    if rest == "":
        return bits
    if len(rest) <= 5:
        bits.append("".join(rest))
        return bits
    bits.append(rest[:5])
    return split5(bits, rest[5:])

# r = (''.join(text[i:i+5]) for i in range(0, len(text), 5))
