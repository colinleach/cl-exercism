using System.Collections.Generic;
using System.Linq;

public static class Luhn
{
    public static bool IsValid(string number)
    {
        string cleaned = number.Replace(" ", "");
        if (cleaned.Length < 2) return false;
        
        var digits = new List<int>();
        foreach (char c in cleaned)
        {
            if (!char.IsDigit(c)) return false;
            digits.Add((int)char.GetNumericValue(c));
        }
        digits.Reverse();
        for (int i = 1; i < digits.Count; i += 2)
        {
            digits[i] *= 2;
            if (digits[i] > 9) digits[i] -= 9;
        }
        return digits.Sum() % 10 == 0;
    }
}
