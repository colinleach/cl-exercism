using System;

static class LogLine
{
    public static string Message(string logLine)
    {
        var line = logLine.Trim();
        var stop = line.IndexOf("]: ");
        return line[(stop + 3)..].Trim();
    }

    public static string LogLevel(string logLine)
    {
        var start = logLine.IndexOf("[");
        var levelLength = logLine.IndexOf("]: ") - start - 1;
        return logLine.Substring(start + 1, levelLength).Trim().ToLower();
    }

    public static string Reformat(string logLine) 
        => $"{Message(logLine)} ({LogLevel(logLine)})";
}