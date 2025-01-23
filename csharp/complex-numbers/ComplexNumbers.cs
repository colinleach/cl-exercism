using System;

public struct ComplexNumber(double real, double imaginary)
{
    public double Real() => real;

    public double Imaginary() => imaginary;

    public ComplexNumber Mul(ComplexNumber other) =>
        new(real * other.Real() - imaginary * other.Imaginary(), 
            real * other.Imaginary() + imaginary * other.Real());

    public ComplexNumber Mul(double other) =>
        new(real * other, imaginary * other);

    public ComplexNumber Add(ComplexNumber other) => 
        new(real + other.Real(), imaginary + other.Imaginary());

    public ComplexNumber Add(double other) => 
        new(real + other, imaginary);

    public ComplexNumber Sub(ComplexNumber other) => 
        new(real - other.Real(), imaginary - other.Imaginary());

    public ComplexNumber Sub(double other) => 
        new(real - other, imaginary);

    public ComplexNumber Div(ComplexNumber other)
    {
        double divisor = other.Real() * other.Real() + other.Imaginary() * other.Imaginary();
        double re = (real * other.Real() + imaginary * other.Imaginary()) / divisor;
        double im = (imaginary * other.Real() - real * other.Imaginary()) / divisor;
        return new ComplexNumber(re, im);
    }

    public ComplexNumber Div(double other) => new(real / other, imaginary / other);

    public double Abs() => Math.Sqrt(real * real + imaginary * imaginary);

    public ComplexNumber Conjugate() => new(real, -imaginary);

    public ComplexNumber Exp() =>
        new (Math.Exp(real) * Math.Cos(imaginary), 
            Math.Exp(real) * Math.Sin(imaginary));
}
