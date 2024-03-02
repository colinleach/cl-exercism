class EliudsEggs
  def self.egg_count(number : Int32) : Int32
    count = 0
    number.to_s(2).each_char do |c|
      if c == '1'
        count += 1
      end
    end
    count
  end
end
