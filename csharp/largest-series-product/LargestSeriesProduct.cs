using System;
using System.Linq;

public static class LargestSeriesProduct
{
    public static long GetLargestProduct(string digits, int span) 
    {
        if (span < 1) throw new ArgumentException("span must be positive");
        if (span > digits.Length) throw new ArgumentException("span must be smaller than string length");
        if (digits.Any(ch => !char.IsDigit(ch)))
            throw new ArgumentException("invalid character found");
        
        var intDigits = digits.Select(ch => ch - '0').ToArray();
        var result = 0L;
        for (var i = 0; i < intDigits.Length - span + 1; i++)
        {
            var product = 1L;
            for (var j = 0; j < span; j++)
            {
                product *= intDigits[i + j];
            }
            result = Math.Max(product, result);
        }

        return result;
    }
}
