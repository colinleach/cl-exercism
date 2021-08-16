# note the trailing spaces on most of these lines:
gifts = """and a Partridge in a Pear Tree.
two Turtle Doves, 
three French Hens, 
four Calling Birds, 
five Gold Rings, 
six Geese-a-Laying, 
seven Swans-a-Swimming, 
eight Maids-a-Milking, 
nine Ladies Dancing, 
ten Lords-a-Leaping, 
eleven Pipers Piping, 
twelve Drummers Drumming, """.split('\n')

days = ["first", "second", "third", "fourth", "fifth", "sixth", 
        "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

def one_verse(verse):
    give = gifts[0:verse]
    give.reverse()
    if verse == 1:
        give[0] = give[0][4:]
    return f"On the {days[verse-1]} day of Christmas my true love gave to me: " + ''.join(give)

def recite(start_verse, end_verse):
    verses = [one_verse(v) for v in range(start_verse, end_verse+1)]
    return verses
