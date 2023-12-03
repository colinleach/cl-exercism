def is_armstrong_number(number):
    digits = [int(digit) for digit in str(number)]
    count = len(digits)
    return sum(digit ** count for digit in digits) == number
