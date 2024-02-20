using System;
using System.Collections.Generic;

public static class Raindrops
{
    public static string Convert(int number)
    {
        var sounds = new Dictionary<int, string>()
        {
            {3, "Pling"}, {5, "Plang"}, {7, "Plong"}
        };
        var result = new List<string>();
        foreach (var item in sounds)
        {
            if (number % item.Key == 0) result.Add(item.Value);
        }

        return result.Count > 0 ? string.Join("", result) : number.ToString();
    }
}