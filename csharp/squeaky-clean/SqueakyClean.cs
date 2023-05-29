using System;
using System.Text;

public static class Identifier
{
    public static string Clean(string identifier)
    {
        var sb = new StringBuilder();
        var nextToUpper = false;
        foreach (var c in identifier)
        {
            if (c.Equals(' ')) sb.Append('_');
            else if (char.IsControl(c)) sb.Append("CTRL");
            else if (c.CompareTo('α') >= 0 && c.CompareTo('ω') <= 0) nextToUpper = false;
            else if (c.Equals('-')) nextToUpper = true;
            else if (char.IsLetter(c))
            {
                sb.Append((nextToUpper) ? char.ToUpper(c) : c);
                nextToUpper = false;
            } 
        }

        return sb.ToString();
    } 
}
