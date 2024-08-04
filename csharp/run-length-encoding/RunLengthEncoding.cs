using System;

public static class RunLengthEncoding
{
    public static string Encode(string input)
    {
        if (input.Length == 0) return "";
        char? prevChar = null;
        int count = 1;
        string output = "";
        foreach(char ch in input)
        {
            if (ch == prevChar)
                count++;
            else
            {
                output += ToAppend(count, prevChar);
                prevChar = ch;
                count = 1;
            }
        }
        return output + ToAppend(count, prevChar);
    }

    public static string Decode(string input)
    {
        var number = "";
        var output = "";
        foreach (char ch in input)
        {
            if (Char.IsDigit(ch))
                number += ch;
            else
            {
                var repeats = number.Length > 0 ? int.Parse(number) : 1;
                output += new string(ch, repeats);
                number = "";
            }
        }
        return output;
    }

    private static string ToAppend(int count, char? prevChar)
    {
        var num = count > 1 ? count.ToString() : "";
        return prevChar.HasValue ? num + prevChar : "";
    }
}
