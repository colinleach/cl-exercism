def line_up(name, number):
    return f'{name}, you are the {number}{ending(number)} customer we serve today. Thank you!'

def ending(number):
    if number % 100 in (11, 12, 13):
        return 'th'
    last_digit = number % 10
    if last_digit == 1:
        return 'st'
    if last_digit == 2:
        return 'nd'
    if last_digit == 3:
        return 'rd'
    return 'th'
