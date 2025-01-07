using System;
using System.Collections.Generic;

public static class PascalsTriangle
{
    public static IEnumerable<IEnumerable<int>> Calculate(int rows)
    {
        if (rows < 0) throw new ArgumentException("number of rows is negative");
        if (rows == 0) return [];
        var result = new int[rows][];
        result[0] = [1];

        for (int i = 1; i < rows; i++)
        {
            var row = new int[i + 1];
            row[0] = 1;
            row[i] = 1;
            for (int j = 1; j < i; j++)
            {
                row[j] = result[i - 1][j - 1] + result[i - 1][j];
            }

            result[i] = row;
        }

        return result;
    }
}