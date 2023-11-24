def equilateral(sides):
    a, b, c = sides
    return valid(sides) and a == b and b == c


def isosceles(sides):
    a, b, c = sides
    return valid(sides) and (a == b or b == c or a == c)


def scalene(sides):
    a, b, c = sides
    return valid(sides) and a != b and b != c and a != c


def valid(sides):
    a, b, c = sides
    return all(side > 0 for side in sides) and a + b > c and a + c > b and b + c > a