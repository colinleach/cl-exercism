using System;

static class SavingsAccount
{
    public static float InterestRate(decimal balance)
        => balance switch
        {
            < 0m => 3.213f,
            < 1000m => 0.5f,
            < 5000m => 1.621f,
            _ => 2.475f
        };

    public static decimal Interest(decimal balance)
        => balance * (decimal) (InterestRate(balance)) / 100.0m;

    public static decimal AnnualBalanceUpdate(decimal balance)
        => balance + Interest(balance);

    public static int YearsBeforeDesiredBalance(decimal balance, decimal targetBalance)
    {
        var years = 0;
        while (balance < targetBalance)
        {
            balance = AnnualBalanceUpdate(balance);
            years++;
        }
        return years;
    }
}

//
// let interestRate (balance: decimal): single =
//     match balance with
//     | i when i < 0m -> 3.213f
//     | i when i < 1000m -> 0.5f
//     | i when i < 5000m -> 1.621f
//     | _ -> 2.475f
//
// let interest (balance: decimal): decimal =
//     balance * decimal (interestRate balance) / 100.0m
//
// let annualBalanceUpdate(balance: decimal): decimal =
//     balance + interest balance
//
//     let amountToDonate(balance: decimal) (taxFreePercentage: float): int =
//     let standardDonation = float balance * taxFreePercentage / 100.0
// if balance <= 0.0m then 0 else int (2.0 * standardDonation)
