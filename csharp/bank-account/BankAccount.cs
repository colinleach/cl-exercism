using System;

public class BankAccount
{
    private decimal _balance { get; set; } = 0m;

    private bool IsOpen { get; set; } = false;

    private readonly object _threadlock = new();
    
    public void Open()
    {
        if (IsOpen) 
            throw new InvalidOperationException("Account is already open");
        IsOpen = true;
    }

    public void Close()
    {
        if (!IsOpen)
            throw new InvalidOperationException("Account is not open");
        IsOpen = false;
    }

    public decimal Balance
    {
        get
        {
            if (!IsOpen)
                throw new InvalidOperationException("Account is not open");
            return _balance;
        }
    }

    public void UpdateBalance(decimal change)
    {
        if (!IsOpen)
            throw new InvalidOperationException("Account is not open");
        lock (_threadlock)
        {
            _balance += change;
        }
    }
}
