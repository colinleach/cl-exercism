import re


def abbreviate(words):
    words = words.replace('-', ' ').upper()
    words = re.sub(r"\s+", ' ', words)
    words = re.sub(r'[^A-Z ]', '', words)
    words = words.split(' ')
    return ''.join([c[0] for c in words])
