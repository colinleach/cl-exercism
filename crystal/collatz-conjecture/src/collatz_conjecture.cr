module CollatzConjecture
  def self.steps(input : Number) : Number
    input > 0 || raise ArgumentError.new
    count = 0
    num = input
    while num != 1
      num =  num.even? ? num / 2 : 3 * num + 1
      count += 1
    end
    count
  end
end
