using static System.Math;

public static class Knapsack
{
    public static int MaximumValue(int maximumWeight, (int weight, int value)[] items)
    {
        if (items.Length == 0) return 0;
        
        int[,] dp = new int[items.Length + 1, maximumWeight + 1];

        for (int i = 1; i <= items.Length; i++)
            for (int j = 1; j <= maximumWeight; j++)
            {
                if (items[i - 1].weight <= j)
                    dp[i, j] = Max(dp[i - 1, j], dp[i - 1, j - items[i - 1].weight] + items[i - 1].value);
                else
                    dp[i, j] = dp[i - 1, j];
            }

        return dp[items.Length, maximumWeight];
    }
}
