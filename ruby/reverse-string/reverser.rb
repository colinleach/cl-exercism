module Reverser
  def self.reverse(input)

    half_length = input.length / 2
    half_length.times {|i| input[i], input[-i-1] = input[-i-1], input[i] }
    input
  end
end