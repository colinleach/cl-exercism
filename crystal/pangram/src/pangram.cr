class Pangram
  def self.pangram?(input : String) : Bool
    letters = input.downcase.chars
    "abcdefghijklmnopqrstuvwxyz".each_char do |c|
      if !letters.includes?(c)
        return false
      end
    end
    true
  end
end
