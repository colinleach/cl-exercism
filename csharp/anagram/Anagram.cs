using System;
using System.Linq;

public class Anagram
{
    private readonly string _word;
    private readonly char[] _sorted;
    
    public Anagram(string baseWord)
    {
        _word = baseWord.ToLower();
        _sorted = Normalize(_word);
    }

    public string[] FindAnagrams(string[] potentialMatches) => 
        potentialMatches.Where(s => 
            (s.ToLower() != _word && 
             Normalize(s).SequenceEqual(_sorted)))
            .ToArray();

    private static char[] Normalize(string test)
    {
        var resp = test.ToLower().ToCharArray();
        Array.Sort(resp);
        return resp;
    }
}
