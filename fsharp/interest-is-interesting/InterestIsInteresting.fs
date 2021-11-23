module InterestIsInteresting

let interestRate (balance: decimal): single =
    match balance with
    | i when i < 0m -> 3.213f
    | i when i < 1000m -> 0.5f
    | i when i < 5000m -> 1.621f
    | _ -> 2.475f

let interest (balance: decimal): decimal =
    balance * decimal (interestRate balance) / 100.0m

let annualBalanceUpdate(balance: decimal): decimal =
    balance + interest balance

let amountToDonate(balance: decimal) (taxFreePercentage: float): int =
    let standardDonation = float balance * taxFreePercentage / 100.0
    if balance <= 0.0m then 0 else int (2.0 * standardDonation)
