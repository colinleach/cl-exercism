using System;

public class SpiralMatrix
{
    public static int[,] GetMatrix(int size)
    {
        int[,] matrix = new int[size, size];
        if (size == 0) return matrix;
        
        int rowStart = 0;
        int rowEnd = size - 1;
        int colStart = 0;
        int colEnd = size - 1;
        int counter = 1;

        while (rowStart <= rowEnd && colStart <= colEnd)
        {
            for (int i = colStart; i <= colEnd; i++)
                 matrix[rowStart, i] = counter++;

            rowStart++;

            for (int i = rowStart; i <= rowEnd; i++)
                matrix[i, colEnd] = counter++;

            colEnd--;

            if (rowStart <= rowEnd)
            {
                for (int i = colEnd; i >= colStart; i--)
                    matrix[rowEnd, i] = counter++;

                rowEnd--;
            }

            if (colStart > colEnd) continue;
 
            for (int i = rowEnd; i >= rowStart; i--)
                matrix[i, colStart] = counter++;

            colStart++;
        }

        return matrix;
    }
}
