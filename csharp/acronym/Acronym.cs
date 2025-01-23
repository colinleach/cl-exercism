using System.Linq;
using System.Text.RegularExpressions;

public static partial class Acronym
{
    public static string Abbreviate(string phrase)
    {
        phrase = phrase.Replace('-', ' ').ToUpper();
        phrase = Regex.Replace(phrase, @"\s+", " ");
        var words = Regex.Replace(phrase, @"[^A-Z ]", "").Split(' ');
        return words.Select(w => w[0]).Aggregate(string.Empty, (a, b) => a + b);
    }
}
