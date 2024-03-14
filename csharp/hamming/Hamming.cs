using System;
using System.Linq;

public static class Hamming
{
    public static int Distance(string firstStrand, string secondStrand)
    {
        if (firstStrand.Length != secondStrand.Length) 
            throw new ArgumentException("Unequal lengths.");

        var pairs = firstStrand.ToCharArray().Zip(secondStrand);
        return pairs.Where(p => p.First != p.Second).ToArray().Length;
    }
}