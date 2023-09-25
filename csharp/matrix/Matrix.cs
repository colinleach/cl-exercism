using System;
using System.Collections.Generic;

public class Matrix
{
    private int[,] _matrix;
    private readonly int _nRows;
    private readonly int _nCols;

    public Matrix(string input)
    {
        string[] rowStrings = input.Split('\n');
        _nRows = rowStrings.Length;
        _nCols = rowStrings[0].Split().Length;
        _matrix = new int[_nRows, _nCols];
        for (int i=0; i<_nRows; i++)
        {
            string[] vals = rowStrings[i].Split();
            for (int j = 0; j < _nCols; j ++) _matrix[i, j] = int.Parse(vals[j]);
        }
    }

    public int[] Row(int row)
    {
        int[] result = new int[_nCols];
        for (int j = 0; j < _nCols; j++) result[j] = _matrix[row - 1, j];
        return result;
    }

    public int[] Column(int col)
    {
        int[] result = new int[_nRows];
        for (int i = 0; i < _nCols; i++)
        {
            try
            {
                result[i] = _matrix[i, col - 1];
            }
            catch (Exception e)
            {
                // ignored missing value
            }
        }
        return result;
    }
}