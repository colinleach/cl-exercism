using System;
using System.Collections.Generic;

public static class NucleotideCount
{
    public static IDictionary<char, int> Count(string sequence)
    {
        var nucleotideCounts = new Dictionary<char, int>
        {
            { 'A', 0 },
            { 'C', 0 },
            { 'G', 0 },
            { 'T', 0 }
        };
        foreach (char c in sequence)
        {
            if (!nucleotideCounts.ContainsKey(c)) throw new ArgumentException();
            nucleotideCounts[c]++;
        }
        return nucleotideCounts;
    }
}
