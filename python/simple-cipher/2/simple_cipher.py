import random
import string


class Cipher:
    def __init__(self, key=None):
        if key is not None:
            self.key = key
        else:
            self.key = ''.join(random.choices(string.ascii_lowercase, k=100))

        self.keylen = len(self.key)

    def encode(self, text):
        return ''.join([self.change(text, inx, True) for inx in range(len(text))])

    def decode(self, text):
        return ''.join([self.change(text, inx, False) for inx in range(len(text))])

    def change(self, text, inx, enc=True):
        offset = ord(self.key[inx % self.keylen]) - ord('a')
        if not enc:
            offset *= -1
        raw_asc = ord(text[inx]) + offset
        if raw_asc > ord('z'):
            raw_asc -= 26
        elif raw_asc < ord('a'):
            raw_asc += 26
        return chr(raw_asc)
