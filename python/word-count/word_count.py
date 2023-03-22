import re

def count_words(sentence):
    sentence = sentence.lower().replace(",", " ")
    sentence = re.sub("\'\s|\s\'", " ", sentence)
    words = re.sub("[^a-z0-9\s\']", " ", sentence).split()
    words = [w.strip("'") for w in words]

    counts = {}
    for w in words:
        if w in counts:
            counts[w] += 1
        elif w != "":
            counts[w] = 1
    return counts
