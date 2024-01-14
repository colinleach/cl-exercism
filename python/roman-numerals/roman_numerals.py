# ROMANS = (
#     (1000, "M"),
#     (900 , "CM"),
#     (500 , "D"),
#     (400 , "CD"),
#     (100 , "C"),
#     (90 , "XC"),
#     (50 , "L"),
#     (40 , "XL"),
#     (10 , "X"),
#     (9 , "IX"),
#     (5 , "V"),
#     (4 , "IV"),
#     (1 , "I")
# )
#
#
# def roman(number):
#     assert(number > 0)
#
#     roman_num = ""
#     for (k, v) in ROMANS:
#         while k <= number:
#             roman_num += v
#             number -= k
#     return roman_num

def roman(number):
    assert (number > 0)

    table = (
        ("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"),
        ("X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"),
        ("C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"),
        ("M", "MM", "MMM"))

    digits = [int(d) for d in str(number)]
    inverter = len(digits) - 1  # row for most-significant digit
    roman_digits = [table[inverter - i][d - 1] for (i, d) in enumerate(digits) if d != 0]
    return ''.join(roman_digits)