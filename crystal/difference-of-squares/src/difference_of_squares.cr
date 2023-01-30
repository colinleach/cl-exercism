module Squares
  def self.square_of_sum(n)
    (n*(n+1)/2)**2
  end

  def self.sum_of_squares(n)
    n * (n+1) * (2*n + 1) / 6
  end

  def self.difference_of_squares(n)
    square_of_sum(n) - sum_of_squares(n)
  end
end
