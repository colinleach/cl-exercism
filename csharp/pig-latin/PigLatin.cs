using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public static class PigLatin
{
    private static string PigWord(string word)
    {
        // Rule 1
        List<char> vowels = ['a', 'e', 'i', 'o', 'u'];
        List<string> specials = ["xr", "yt"];
        if (vowels.Contains(word[0]) || specials.Contains(word[..2]))
            return (word + "ay");

        // Rule 3
        Match m3 = Regex.Match(word, @"^([^aeiou]*qu)(.*)");
        if (m3.Success)
            return m3.Groups[2].Value + m3.Groups[1].Value + "ay";
        
        // Rules 2 and 4
        Match m24 = Regex.Match(word, @"^([^aeiou]+)([aeiouy].*)");
        if (m24.Success)
            return m24.Groups[2].Value + m24.Groups[1].Value + "ay";

        return "Error";
    }

    public static string Translate(string text)
    {
        var results = text.Split(' ').Select(w => PigWord(w));
        return string.Join(" ", results);
    }
}
