using System;
using System.Collections.Generic;
using System.Linq;

public class HighScores
{
    private readonly List<int> _scores;
    
    public HighScores(List<int> list) => _scores = list;

    public List<int> Scores() => _scores;

    public int Latest() => _scores.Last();

    public int PersonalBest() => _scores.Max();

    public List<int> PersonalTopThree()
    {
        List<int> sortedScores = new List<int> (_scores);
        sortedScores.Sort();
        sortedScores.Reverse();
        return (sortedScores.Count >= 3) ? sortedScores.GetRange(0, 3) : sortedScores;
    }
}