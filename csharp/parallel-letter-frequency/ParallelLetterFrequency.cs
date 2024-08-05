using System;
using System.Collections.Generic;
using System.Linq;

public static class ParallelLetterFrequency
{
    public static Dictionary<char, int> Calculate(IEnumerable<string> texts) => 
        texts.AsParallel().Aggregate(new Dictionary<char, int>(), UpdateCount);

    private static Dictionary<char, int> UpdateCount(Dictionary<char, int> frequency, string text)
    {
        foreach (char c in text.ToLower())
            if (char.IsLetter(c))
            {
                if (frequency.TryGetValue(c, out var value))
                    frequency[c] = ++value;
                else
                    frequency[c] = 1;
            }

        return frequency;
    }
}