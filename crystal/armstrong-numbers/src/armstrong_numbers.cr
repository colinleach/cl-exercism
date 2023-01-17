class ArmstrongNumbers
    def self.armstrong_number?(num)
        digits = num.digits
        digits_to_pow = digits.map() { |d| d**digits.size }
        digits_to_pow.sum == num
    end
end