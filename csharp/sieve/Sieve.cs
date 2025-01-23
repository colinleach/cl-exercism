using System;
using System.Linq;

public static class Sieve
{
    public static int[] Primes(int limit)
    {
        ArgumentOutOfRangeException.ThrowIfNegative(limit);
        (int, bool?)[] numbers = new (int, bool?)[limit + 1];
        numbers[0] = (0, false);
        numbers[1] = (1, false);
        for (int i = 2; i < limit + 1; i++) 
            numbers[i] = (i, null);

        while (true)
        {
            var nextPrime = numbers
                .Where(n => n.Item2 == null)
                .Select(n => n.Item1)
                .FirstOrDefault();
            if (nextPrime == 0)
                break;
            numbers[nextPrime] = (nextPrime, true);
            for (int i = nextPrime + 1; i < limit + 1; i++)
                if (i % nextPrime == 0)
                    numbers[i] = (i, false);
        }
        return numbers
            .Where(n => n.Item2 == true)
            .Select(n => n.Item1)
            .ToArray();
    }
}
