using System;

public static class LogAnalysis
{
    public static string SubstringAfter(this string str, string subString)
        => str[(str.IndexOf(subString) + subString.Length)..];

    public static string SubstringBetween(this string str, string sub1, string sub2)
        => str[(str.IndexOf(sub1) + sub1.Length)..str.IndexOf(sub2)];
    
    public static string Message(this string str)
        => str[(str.IndexOf("]: ") + 3)..];

    public static string LogLevel(this string str)
        => str[1..str.IndexOf("]")];
}
