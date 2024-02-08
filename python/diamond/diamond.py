import string


def rows(letter):
    if letter == 'A':
        return ['A',]
    letter_index = string.ascii_uppercase.index(letter)
    rows_list = [" " * letter_index + "A" + " " * letter_index]
    for i, c in enumerate(string.ascii_uppercase[1:letter_index + 1]):
        lhs = " " * (letter_index - i - 1) + c + " " * i
        rows_list.append(lhs + " " + lhs[::-1])
    return rows_list + rows_list[-2::-1]
