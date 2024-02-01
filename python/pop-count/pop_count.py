def egg_count(display_value):
    return sum([1 for d in bin(display_value) if d == '1'])
