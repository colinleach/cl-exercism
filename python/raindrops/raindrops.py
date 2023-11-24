def convert(number):
    pairs = zip((3, 5, 7), ('Pling', 'Plang', 'Plong'))
    response = ''.join(sound for factor, sound in pairs if number % factor == 0)
    return response if response else str(number)
