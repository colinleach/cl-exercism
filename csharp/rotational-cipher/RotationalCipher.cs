using System;
using System.Linq;

public static class RotationalCipher
{
    private static int a { get; } = Convert.ToInt32('a');
    private static int z{ get; } = Convert.ToInt32('z');
    private static int A { get; } = Convert.ToInt32('A');
    private static int Z { get; } = Convert.ToInt32('Z');
    
    public static string Rotate(string text, int shiftKey)
    {
        var crypt = text.Select(c => RotateChar(c, shiftKey));
        return string.Concat(crypt);
    }

    private static char RotateChar(char input, int shiftKey)
    {
        var plain = Convert.ToInt32(input);
        if (a <= plain && plain <= z)
            return Convert.ToChar(a + (plain - a + shiftKey) % 26);
        if (A <= plain && plain <= Z)
            return Convert.ToChar(A + (plain - A + shiftKey) % 26);
        return input;
    }
}
