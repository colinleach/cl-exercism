using System;

public static class ResistorColor
{
    public static int ColorCode(string color) => Array.IndexOf(Colors(), color);

    public static string[] Colors()
    {
        string[] colorList = { "black", "brown", "red", "orange", "yellow", 
                                "green", "blue", "violet", "grey", "white" };
        return colorList;
    }
}
