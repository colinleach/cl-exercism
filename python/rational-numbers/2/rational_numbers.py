import math


class Rational:
    def __init__(self, numer, denom):
        self.numer = numer
        self.denom = denom
        self.lowest_terms()

    def __eq__(self, other):
        return self.numer == other.numer and self.denom == other.denom

    def __repr__(self):
        return f'{self.numer}/{self.denom}'

    def __add__(self, other):
        return Rational(self.numer * other.denom + other.numer * self.denom, self.denom * other.denom)

    def __sub__(self, other):
        return Rational(self.numer * other.denom - other.numer * self.denom, self.denom * other.denom)

    def __mul__(self, other):
        return Rational(self.numer * other.numer, self.denom * other.denom)

    def __truediv__(self, other):
        return Rational(self.numer * other.denom, self.denom * other.numer)

    def __abs__(self):
        return Rational(abs(self.numer), abs(self.denom))

    def __pow__(self, power):
        if isinstance(power, int):
            if power >= 0:
                return Rational(self.numer ** power, self.denom ** power)
            else:
                return Rational(self.denom ** -power, self.numer ** -power)

        # real power returns real
        return self.numer ** power / self.denom ** power

    def __rpow__(self, base):
        return (base ** self.numer) ** (1 / self.denom)

    def lowest_terms(self):
        hcf = math.gcd(self.numer, self.denom)
        self.numer //= hcf
        self.denom //= hcf
        if self.denom< 0:
            self.numer *= -1
            self.denom *= -1
