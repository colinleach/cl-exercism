import string

def translate(text):
    vowel_sounds = {'a', 'e', 'i', 'o' 'u', 'xr', 'yt'}
    consonant_sounds = set(string.ascii_lowercase).union(['ch', 'st'])
    if any([text.startswith(vs) for vs in vowel_sounds]):
        mod_text = text + 'ay'  # rule 1
    elif :
        mod_text = text[1:] + text[0] + 'ay'  # rule 2



    return mod_text
