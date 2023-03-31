import math


class ComplexNumber:
    def __init__(self, real, imaginary):
        self.real = real
        self.imaginary = imaginary

    def __eq__(self, other):
        if isinstance(other, (int, float)):
            other = ComplexNumber(other, 0)
        return self.real == other.real and self.imaginary == other.imaginary

    def __add__(self, other):
        if isinstance(other, (int, float)):
            other = ComplexNumber(other, 0)
        return ComplexNumber(self.real + other.real, self.imaginary + other.imaginary)

    def __radd__(self, other):
        if isinstance(other, (int, float)):
            return ComplexNumber(self.real + other, self.imaginary)

    def __mul__(self, other):
        if isinstance(other, (int, float)):
            return ComplexNumber(self.real * other, self.imaginary * other)
        return ComplexNumber(self.real * other.real - self.imaginary * other.imaginary, self.real * other.imaginary + self.imaginary * other.real)

    def __rmul__(self, other):
        if isinstance(other, (int, float)):
            return ComplexNumber(self.real * other, self.imaginary * other)

    def __sub__(self, other):
        if isinstance(other, (int, float)):
            other = ComplexNumber(other, 0)
        return ComplexNumber(self.real - other.real, self.imaginary - other.imaginary)

    def __rsub__(self, other):
        if isinstance(other, (int, float)):
            return ComplexNumber(other - self.real, -self.imaginary)

    def __truediv__(self, other):
        if isinstance(other, (int, float)):
            return ComplexNumber(self.real / other, self.imaginary / other)
        divisor = other.real**2 + other.imaginary**2
        re = (self.real * other.real + self.imaginary * other.imaginary) / divisor
        im = (self.imaginary * other.real - self.real * other.imaginary) / divisor
        return ComplexNumber(re, im)

    def __rtruediv__(self, other):
        if isinstance(other, (int, float)):
            return ComplexNumber(other, 0) / self

    def __abs__(self):
        return math.sqrt(self.real**2 + self.imaginary**2)

    def conjugate(self):
        return ComplexNumber(self.real, -self.imaginary)

    def exp(self):
        return ComplexNumber(math.exp(self.real) * math.cos(self.imaginary), math.exp(self.real) * math.sin(self.imaginary))
