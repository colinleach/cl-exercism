using System;
using System.Text;

public static class FoodChain
{
    private static readonly string[] Animals = ["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"];

    private static readonly string[] Line2 =
    [
        "",
        "It wriggled and jiggled and tickled inside her.\n",
        "How absurd to swallow a bird!\n",
        "Imagine that, to swallow a cat!\n",
        "What a hog, to swallow a dog!\n",
        "Just opened her throat and swallowed a goat!\n",
        "I don't know how she swallowed a cow!\n",
        "She's dead, of course!"
    ];

    private const string Wriggle = " that wriggled and jiggled and tickled inside her.\n";
    private const string Last = "I don't know why she swallowed the fly. Perhaps she'll die.";


    public static string Recite(int verseNumber)
    {
        StringBuilder verse = new();
        verse.Append($"I know an old lady who swallowed a {Animals[verseNumber - 1]}.\n");
        verse.Append(Line2[verseNumber - 1]);
        if (Animals[verseNumber - 1] == "horse")
            return verse.ToString().Trim();
         
        if (verseNumber < Animals.Length)
        {
            for (int i = verseNumber - 1; i > 0; i--)
            {
                verse.Append($"She swallowed the {Animals[i]} to catch the {Animals[i - 1]}");
                verse.Append(Animals[i - 1] == "spider" ? Wriggle : ".\n");
            }
        }

        verse.Append(Last);
        return verse.ToString().Trim();
    }

    public static string Recite(int startVerse, int endVerse)
    {
        StringBuilder verses = new StringBuilder(Recite(startVerse));
        for (int i = startVerse + 1; i <= endVerse; i++)
        {
            verses.Append("\n\n");
            verses.Append(Recite(i));
        }
        return verses.ToString().Trim();
    }
}
