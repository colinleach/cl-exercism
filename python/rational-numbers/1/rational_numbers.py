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
        self.numer = self.numer * other.denom + other.numer * self.denom
        self.denom = self.denom * other.denom
        self.lowest_terms()
        return self

    def __sub__(self, other):
        self.numer = self.numer * other.denom - other.numer * self.denom
        self.denom = self.denom * other.denom
        self.lowest_terms()
        return self

    def __mul__(self, other):
        self.numer = self.numer * other.numer
        self.denom = self.denom * other.denom
        self.lowest_terms()
        return self

    def __truediv__(self, other):
        self.numer = self.numer * other.denom
        self.denom = self.denom * other.numer
        self.lowest_terms()
        return self

    def __abs__(self):
        self.numer = abs(self.numer)
        self.denom = abs(self.denom)
        self.lowest_terms()
        return self

    def __pow__(self, power):
        if isinstance(power, int):
            if power >= 0:
                self.numer = self.numer ** power
                self.denom = self.denom ** power
            else:
                self.numer, self.denom = (self.denom ** -power, self.numer ** -power)
        else:
            # real power returns real
            return self.numer ** power / self.denom ** power
        self.lowest_terms()
        return self

    def __rpow__(self, base):
        return (base ** self.numer) ** (1 / self.denom)

    def lowest_terms(self):
        hcf = math.gcd(self.numer, self.denom)
        self.numer //= hcf
        self.denom //= hcf
        if self.denom< 0:
            self.numer *= -1
            self.denom *= -1
