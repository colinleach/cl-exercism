module ArmstrongNumbers
  def self.include?(number)
    digits = number.digits
    digits.map { |d| d**digits.size }.sum == number
  end
end
