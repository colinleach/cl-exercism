public static class Diamond
{
    public static string Make(char target)
    {
        if (target == 'A') return "A";
        var letterIndex = target - 'A';
        var rows = new string[2 * letterIndex + 1];
        rows[0] = new string(' ', letterIndex) + "A" + new string(' ', letterIndex);
        rows[2 * letterIndex] = rows[0];
        for (int i = 1; i <= letterIndex; i++)
        {
            var outer = new string(' ', letterIndex - i);
            var inner = new string(' ', 2 * i - 1);
            var letter = (char)('A' + i);
            rows[i] = outer + letter + inner + letter + outer;
            rows[2 * letterIndex - i] = rows[i];
        }

        return string.Join("\n", rows);
    }
}
