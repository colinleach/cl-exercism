using System;
using System.Collections.Generic;
using System.Linq;

public enum Plant
{
    Violets,
    Radishes,
    Clover,
    Grass
}

public class KindergartenGarden(string diagram)
{
    private string[] _rows = diagram.Split('\n');

    private static readonly string[] _students =
    [
        "Alice", "Bob", "Charlie", "David",
        "Eve", "Fred", "Ginny", "Harriet",
        "Ileana", "Joseph", "Kincaid", "Larry"
    ];

    private static Dictionary<char, Plant> _species = new()
    {
        {'G', Plant.Grass },
        {'C', Plant.Clover },
        {'R', Plant.Radishes},
        {'V', Plant.Violets}
    };

    public IEnumerable<Plant> Plants(string student)
    {
        int start = 2 * Array.IndexOf(_students, student);
        string owns = _rows[0].Substring(start, 2) + _rows[1].Substring(start, 2);
        List<Plant> output = new();
        foreach (char c in owns)
        {
            output.Add(_species[c]);
        }

        return output.ToList();
    }
}
