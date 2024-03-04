class BankAccount
  def initialize
    @is_open = false
    @balance = 0
  end

  def balance
    raise ArgumentError.new unless @is_open
    @balance
  end

  def open
    raise ArgumentError.new if @is_open
    @is_open = true
    @balance = 0
  end

  def deposit(amount)
    raise ArgumentError.new unless @is_open
    raise ArgumentError.new unless amount > 0
    @balance += amount
  end

  def withdraw(amount)
    raise ArgumentError.new unless @is_open
    raise ArgumentError.new unless amount > 0
    raise ArgumentError.new unless amount <= @balance
    @balance -= amount
  end

  def close
    raise ArgumentError.new unless @is_open
    @is_open = false
    @balance = 0
  end
end
