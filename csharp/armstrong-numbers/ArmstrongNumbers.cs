using System;
using System.Linq;

public static class ArmstrongNumbers
{
    public static bool IsArmstrongNumber(int number)
    {
        var digits = number.ToString().Select(t=>int.Parse(t.ToString())).ToArray();
        var numDigits = digits.Length;
        var powers = digits.Select(digit => Math.Pow(digit, numDigits)).ToArray();
        return (int)powers.Sum() == number;
    }
}