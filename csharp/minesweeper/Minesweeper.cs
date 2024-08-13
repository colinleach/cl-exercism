using System.Collections.Generic;

public static class Minesweeper
{
    private static string ProcessSquare(string[] minefield, int row, int col)
    {
        char value = minefield[row][col];
        if (value == '*') return "*";
        int count = 0;
        for (int i = row - 1; i <= row + 1; i++)
            for (int j = col - 1; j <= col + 1; j++)
                if (    i >= 0 && i < minefield.Length && 
                        j >= 0 && j < minefield[i].Length && 
                        minefield[i][j] == '*')
                    count++;

        return count >0 ? count.ToString() : " ";
    }
    
    public static string[] Annotate(string[] minefield)
    {
        int rows = minefield.Length;
        int cols;
        if (rows > 0) cols = minefield[0].Length;
        else return [];

        List<string> outputRows = new();
        for (int r = 0; r < rows; r++)
        {
            string outputCols = "";
            for (int c = 0; c < cols; c++)
                outputCols += ProcessSquare(minefield, r, c);
            outputRows.Add(outputCols);
        }

        return outputRows.ToArray();
    }
}
