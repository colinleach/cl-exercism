module SavingsAccount
  def self.interest_rate(balance)
    return 3.213 if balance < 0
    return 0.5 if balance < 1000
    return 1.621 if balance < 5000
    2.475
  end

  def self.annual_balance_update(balance)
    balance * (1 + self.interest_rate(balance) / 100)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    while current_balance < desired_balance
      current_balance = self.annual_balance_update(current_balance)
      years += 1
    end
    years
  end
end
