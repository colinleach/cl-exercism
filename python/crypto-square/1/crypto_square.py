import re
from math import ceil, sqrt


def cipher_text(plain_text):
    regex = re.compile('[^a-z0-9]')
    norm = regex.sub('', plain_text.lower())
    normlen = len(norm)
    if normlen < 1:
        return ''

    c = ceil(sqrt(normlen))
    r = ceil(normlen / c)
    norm += ' ' * (c * r - normlen)
    chunks = [norm[0+i:c+i] for i in range(0, normlen, c)]

    return ' '.join([''.join([chunk[col] for chunk in chunks]) for col in range(c)])
