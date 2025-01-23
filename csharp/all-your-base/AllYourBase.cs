using System;
using System.Collections.Generic;
using System.Linq;

public static class AllYourBase
{
    public static int[] Rebase(int inputBase, int[] inputDigits, int outputBase)
    {
        if (inputBase < 2) throw new ArgumentException("input base must be >= 2");
        if (outputBase < 2) throw new ArgumentException("output base must be >= 2");
        if (inputDigits.Any(d => d < 0 || d >= inputBase)) 
            throw new ArgumentException("all digits must satisfy 0 <= d < input base");

        var number = inputDigits.Aggregate(0, (current, digit) => current * inputBase + digit);
        List<int> result = new();
        while (number >= outputBase)
        {
            var digit = number % outputBase;
            result.Add(digit);
            number = (number - digit) / outputBase;
        }
        result.Add(number);
        result.Reverse();
        return result.ToArray();
    }
}
