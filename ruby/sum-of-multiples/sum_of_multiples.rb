class SumOfMultiples
  def initialize(*values)
    @values = values.reject { |val| val.zero? }
  end

  def to(limit)
    multiples = []
    @values.each do |val|
      mult = val
      while mult < limit
        multiples << mult
        mult += val
      end
    end
    multiples.uniq.sum
  end
end