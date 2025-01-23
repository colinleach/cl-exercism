using System;
using System.Linq;

public static class RomanNumeralExtension
{
    private static string[,] table =
    {
        { "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", },
        { "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC", },
        { "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM", },
        { "M", "MM", "MMM", "", "", "", "", "", "", }
    };

    public static string ToRoman(this int value)
    {
        int[] digits = value.ToString().Select(d => Convert.ToInt32(d) - 48).ToArray();
        int inverter = digits.Length - 1;
        
        var romanDigits = digits
            .Select<int, object>((digit, index) => 
                digit > 0 ? table[inverter - index, digit - 1] : "");
        return string.Join("", romanDigits);
     }
}
