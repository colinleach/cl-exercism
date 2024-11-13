class ParallelLetterFrequency
  # Version 2 : ractor parallelism
  #
  def self.count(texts)
    ractors = texts.map(&:downcase).map do |text|
      Ractor.new(text) do |text|
        text.each_char.select do |letter|
          letter.match?(/\p{Alpha}/)
        end.tally
      end
    end

    ractors.each_with_object(Hash.new(0)) do |ractor, count|
      ractor.take.each { |letter, val| count[letter] += val }
    end
  end
end
