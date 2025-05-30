using System;
using Xunit;

public class ComplexNumbersTests
{
    [Fact]
    public void Real_part_of_a_purely_real_number()
    {
        var sut = new ComplexNumber(1, 0);
        Assert.Equal(1, sut.Real());
    }

    [Fact]
    public void Real_part_of_a_purely_imaginary_number()
    {
        var sut = new ComplexNumber(0, 1);
        Assert.Equal(0, sut.Real());
    }

    [Fact]
    public void Real_part_of_a_number_with_real_and_imaginary_part()
    {
        var sut = new ComplexNumber(1, 2);
        Assert.Equal(1, sut.Real());
    }

    [Fact]
    public void Imaginary_part_of_a_purely_real_number()
    {
        var sut = new ComplexNumber(1, 0);
        Assert.Equal(0, sut.Imaginary());
    }

    [Fact]
    public void Imaginary_part_of_a_purely_imaginary_number()
    {
        var sut = new ComplexNumber(0, 1);
        Assert.Equal(1, sut.Imaginary());
    }

    [Fact]
    public void Imaginary_part_of_a_number_with_real_and_imaginary_part()
    {
        var sut = new ComplexNumber(1, 2);
        Assert.Equal(2, sut.Imaginary());
    }

    [Fact]
    public void Imaginary_unit()
    {
        var sut = new ComplexNumber(0, 1);
        var expected = new ComplexNumber(-1, 0);
        Assert.Equal(expected.Real(), sut.Mul(new ComplexNumber(0, 1)).Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Mul(new ComplexNumber(0, 1)).Imaginary(), precision: 7);
    }

    [Fact]
    public void Add_purely_real_numbers()
    {
        var sut = new ComplexNumber(1, 0);
        var expected = new ComplexNumber(3, 0);
        Assert.Equal(expected.Real(), sut.Add(new ComplexNumber(2, 0)).Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Add(new ComplexNumber(2, 0)).Imaginary(), precision: 7);
    }

    [Fact]
    public void Add_purely_imaginary_numbers()
    {
        var sut = new ComplexNumber(0, 1);
        var expected = new ComplexNumber(0, 3);
        Assert.Equal(expected.Real(), sut.Add(new ComplexNumber(0, 2)).Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Add(new ComplexNumber(0, 2)).Imaginary(), precision: 7);
    }

    [Fact]
    public void Add_numbers_with_real_and_imaginary_part()
    {
        var sut = new ComplexNumber(1, 2);
        var expected = new ComplexNumber(4, 6);
        Assert.Equal(expected.Real(), sut.Add(new ComplexNumber(3, 4)).Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Add(new ComplexNumber(3, 4)).Imaginary(), precision: 7);
    }

    [Fact]
    public void Subtract_purely_real_numbers()
    {
        var sut = new ComplexNumber(1, 0);
        var expected = new ComplexNumber(-1, 0);
        Assert.Equal(expected.Real(), sut.Sub(new ComplexNumber(2, 0)).Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Sub(new ComplexNumber(2, 0)).Imaginary(), precision: 7);
    }

    [Fact]
    public void Subtract_purely_imaginary_numbers()
    {
        var sut = new ComplexNumber(0, 1);
        var expected = new ComplexNumber(0, -1);
        Assert.Equal(expected.Real(), sut.Sub(new ComplexNumber(0, 2)).Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Sub(new ComplexNumber(0, 2)).Imaginary(), precision: 7);
    }

    [Fact]
    public void Subtract_numbers_with_real_and_imaginary_part()
    {
        var sut = new ComplexNumber(1, 2);
        var expected = new ComplexNumber(-2, -2);
        Assert.Equal(expected.Real(), sut.Sub(new ComplexNumber(3, 4)).Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Sub(new ComplexNumber(3, 4)).Imaginary(), precision: 7);
    }

    [Fact]
    public void Multiply_purely_real_numbers()
    {
        var sut = new ComplexNumber(1, 0);
        var expected = new ComplexNumber(2, 0);
        Assert.Equal(expected.Real(), sut.Mul(new ComplexNumber(2, 0)).Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Mul(new ComplexNumber(2, 0)).Imaginary(), precision: 7);
    }

    [Fact]
    public void Multiply_purely_imaginary_numbers()
    {
        var sut = new ComplexNumber(0, 1);
        var expected = new ComplexNumber(-2, 0);
        Assert.Equal(expected.Real(), sut.Mul(new ComplexNumber(0, 2)).Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Mul(new ComplexNumber(0, 2)).Imaginary(), precision: 7);
    }

    [Fact]
    public void Multiply_numbers_with_real_and_imaginary_part()
    {
        var sut = new ComplexNumber(1, 2);
        var expected = new ComplexNumber(-5, 10);
        Assert.Equal(expected.Real(), sut.Mul(new ComplexNumber(3, 4)).Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Mul(new ComplexNumber(3, 4)).Imaginary(), precision: 7);
    }

    [Fact]
    public void Divide_purely_real_numbers()
    {
        var sut = new ComplexNumber(1, 0);
        var expected = new ComplexNumber(0.5, 0);
        Assert.Equal(expected.Real(), sut.Div(new ComplexNumber(2, 0)).Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Div(new ComplexNumber(2, 0)).Imaginary(), precision: 7);
    }

    [Fact]
    public void Divide_purely_imaginary_numbers()
    {
        var sut = new ComplexNumber(0, 1);
        var expected = new ComplexNumber(0.5, 0);
        Assert.Equal(expected.Real(), sut.Div(new ComplexNumber(0, 2)).Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Div(new ComplexNumber(0, 2)).Imaginary(), precision: 7);
    }

    [Fact]
    public void Divide_numbers_with_real_and_imaginary_part()
    {
        var sut = new ComplexNumber(1, 2);
        var expected = new ComplexNumber(0.44, 0.08);
        Assert.Equal(expected.Real(), sut.Div(new ComplexNumber(3, 4)).Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Div(new ComplexNumber(3, 4)).Imaginary(), precision: 7);
    }

    [Fact]
    public void Absolute_value_of_a_positive_purely_real_number()
    {
        var sut = new ComplexNumber(5, 0);
        Assert.Equal(5, sut.Abs());
    }

    [Fact]
    public void Absolute_value_of_a_negative_purely_real_number()
    {
        var sut = new ComplexNumber(-5, 0);
        Assert.Equal(5, sut.Abs());
    }

    [Fact]
    public void Absolute_value_of_a_purely_imaginary_number_with_positive_imaginary_part()
    {
        var sut = new ComplexNumber(0, 5);
        Assert.Equal(5, sut.Abs());
    }

    [Fact]
    public void Absolute_value_of_a_purely_imaginary_number_with_negative_imaginary_part()
    {
        var sut = new ComplexNumber(0, -5);
        Assert.Equal(5, sut.Abs());
    }

    [Fact]
    public void Absolute_value_of_a_number_with_real_and_imaginary_part()
    {
        var sut = new ComplexNumber(3, 4);
        Assert.Equal(5, sut.Abs());
    }

    [Fact]
    public void Conjugate_a_purely_real_number()
    {
        var sut = new ComplexNumber(5, 0);
        var expected = new ComplexNumber(5, 0);
        Assert.Equal(expected.Real(), sut.Conjugate().Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Conjugate().Imaginary(), precision: 7);
    }

    [Fact]
    public void Conjugate_a_purely_imaginary_number()
    {
        var sut = new ComplexNumber(0, 5);
        var expected = new ComplexNumber(0, -5);
        Assert.Equal(expected.Real(), sut.Conjugate().Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Conjugate().Imaginary(), precision: 7);
    }

    [Fact]
    public void Conjugate_a_number_with_real_and_imaginary_part()
    {
        var sut = new ComplexNumber(1, 1);
        var expected = new ComplexNumber(1, -1);
        Assert.Equal(expected.Real(), sut.Conjugate().Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Conjugate().Imaginary(), precision: 7);
    }

    [Fact]
    public void Eulers_identity_formula()
    {
        var sut = new ComplexNumber(0, Math.PI);
        var expected = new ComplexNumber(-1, 0);
        Assert.Equal(expected.Real(), sut.Exp().Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Exp().Imaginary(), precision: 7);
    }

    [Fact]
    public void Exponential_of_0()
    {
        var sut = new ComplexNumber(0, 0);
        var expected = new ComplexNumber(1, 0);
        Assert.Equal(expected.Real(), sut.Exp().Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Exp().Imaginary(), precision: 7);
    }

    [Fact]
    public void Exponential_of_a_purely_real_number()
    {
        var sut = new ComplexNumber(1, 0);
        var expected = new ComplexNumber(Math.E, 0);
        Assert.Equal(expected.Real(), sut.Exp().Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Exp().Imaginary(), precision: 7);
    }

    [Fact]
    public void Exponential_of_a_number_with_real_and_imaginary_part()
    {
        var sut = new ComplexNumber(Math.Log(2.0), Math.PI);
        var expected = new ComplexNumber(-2, 0);
        Assert.Equal(expected.Real(), sut.Exp().Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Exp().Imaginary(), precision: 7);
    }

    [Fact]
    public void Exponential_resulting_in_a_number_with_real_and_imaginary_part()
    {
        var sut = new ComplexNumber(Math.Log(2.0)/2, Math.PI/4);
        var expected = new ComplexNumber(1, 1);
        Assert.Equal(expected.Real(), sut.Exp().Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Exp().Imaginary(), precision: 7);
    }

    [Fact]
    public void Add_real_number_to_complex_number()
    {
        var sut = new ComplexNumber(1, 2);
        var expected = new ComplexNumber(6, 2);
        Assert.Equal(expected.Real(), sut.Add(5).Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Add(5).Imaginary(), precision: 7);
    }
    
    [Fact]
    public void Multiply_complex_number_by_real_number()
    {
        var sut = new ComplexNumber(2, 5);
        var expected = new ComplexNumber(10, 25);
        Assert.Equal(expected.Real(), sut.Mul(5).Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Mul(5).Imaginary(), precision: 7);
    }
    
    [Fact]
    public void Divide_complex_number_by_real_number()
    {
        var sut = new ComplexNumber(10, 100);
        var expected = new ComplexNumber(1, 10);
        Assert.Equal(expected.Real(), sut.Div(10).Real(), precision: 7);
        Assert.Equal(expected.Imaginary(), sut.Div(10).Imaginary(), precision: 7);
    }
}
