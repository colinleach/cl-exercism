import math

def largest_product(series, size):
    if size < 0:
        raise ValueError("span must not be negative")
    if size > len(series):
        raise ValueError("span must be smaller than string length")
    if series == "" or size == 0:
        return 1

    digits = to_digits(series)
    return max([math.prod(digits[i:i+size]) for i in range(len(digits)-size+1)])

def to_digits(series):
    try:
        return [int(a) for a in series]
    except ValueError:
        raise ValueError("digits input must only contain digits")
