using System;
using System.Linq;

public static class Pangram
{
    public static bool IsPangram(string input)
    {
        var chars = input.ToUpper().ToCharArray();
        foreach (var letter in "ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray())
        {
            if (!chars.Contains(letter)) return false;
        }

        return true;
    }
}
