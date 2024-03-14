using System;
using System.Linq;

public static class Isogram
{
    public static bool IsIsogram(string word)
    {
        var letters = word.ToLower().ToList().Where(char.IsLetter);
        var chars = letters as char[] ?? letters.ToArray();
        return chars.ToArray().Length == chars.Distinct().ToArray().Length;
    }
}
