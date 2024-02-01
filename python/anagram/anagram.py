def find_anagrams(word, candidates):
    def sorted_word(s):
        return ''.join(sorted(s.lower()))
    word = word.lower()
    word_sort = sorted_word(word)
    return [w for w in candidates if w.lower() != word and sorted_word(w) == word_sort]
