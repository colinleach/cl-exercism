module Hamming
  def self.distance(strand1 : String, strand2 : String) : Number
    raise ArgumentError.new unless strand1.size == strand2.size
    count = 0
    (0...strand1.size).each do |i|
      count += 1 unless strand1[i] == strand2[i]
    end
    count
  end
end
