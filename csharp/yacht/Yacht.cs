using System;
using System.Linq;

public enum YachtCategory
{
    Ones = 1,
    Twos = 2,
    Threes = 3,
    Fours = 4,
    Fives = 5,
    Sixes = 6,
    FullHouse = 7,
    FourOfAKind = 8,
    LittleStraight = 9,
    BigStraight = 10,
    Choice = 11,
    Yacht = 12,
}

public static class YachtGame
{
    public static int Score(int[] dice, YachtCategory category)
    {
        var freq = new int[6];
        for (int i = 1; i <= 6; i++)
            freq[i - 1] = dice.Count(d => d == i);
        var maxFreq = freq.Max();
        var maxFreqVal = freq.ToList().IndexOf(maxFreq) + 1;

        return category switch
        {
            YachtCategory.Yacht => maxFreq == 5 ? 50 : 0,
            YachtCategory.Ones or YachtCategory.Twos or YachtCategory.Threes or YachtCategory.Fours
                or YachtCategory.Fives or YachtCategory.Sixes => dice.Sum(d => d == (int)category ? d : 0),
            YachtCategory.FullHouse => freq.Contains(3) && freq.Contains(2) ? dice.Sum() : 0,
            YachtCategory.FourOfAKind => maxFreq >= 4 ? 4 * maxFreqVal : 0,
            YachtCategory.LittleStraight => dice.OrderBy(n => n).SequenceEqual([1, 2, 3, 4, 5]) ? 30 : 0,
            YachtCategory.BigStraight => dice.OrderBy(n => n).SequenceEqual([2, 3, 4, 5, 6]) ? 30 : 0,
            YachtCategory.Choice => dice.Sum(),
            _ => throw new ArgumentOutOfRangeException(nameof(category), category, null)
        };
    }
}
