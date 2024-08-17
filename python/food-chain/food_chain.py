ANIMALS = ["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"]
LINE2 = ["",
         "It wriggled and jiggled and tickled inside her.",
         "How absurd to swallow a bird!",
         "Imagine that, to swallow a cat!",
         "What a hog, to swallow a dog!",
         "Just opened her throat and swallowed a goat!",
         "I don't know how she swallowed a cow!",
         "She's dead, of course!"]

WRIGGLE = " that wriggled and jiggled and tickled inside her."
LAST = "I don't know why she swallowed the fly. Perhaps she'll die."


def make_verse(n):
    verse = ["", f"I know an old lady who swallowed a {ANIMALS[n]}."]
    if LINE2[n]:
        verse.append(LINE2[n])

    if ANIMALS[n] == "horse":
        return verse

    for v in range(n, 0, -1):
        line = f"She swallowed the {ANIMALS[v]} to catch the {ANIMALS[v-1]}"
        line += WRIGGLE if ANIMALS[v - 1] == "spider" else "."
        verse.append(line)

    verse.append(LAST)
    return verse


def recite(start_verse, end_verse):
    verses = [make_verse(i) for i in range(start_verse-1, end_verse)]
    all_verses = [line for v in verses for line in v]
    return all_verses[1:]
