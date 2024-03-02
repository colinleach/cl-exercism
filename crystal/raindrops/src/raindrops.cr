class Raindrops
  def self.convert(num : Int32) : String
    sound = String::Builder.new
    sound << "Pling" if num % 3 == 0
    sound << "Plang" if num % 5 == 0
    sound << "Plong" if num % 7 == 0
    sound = sound.to_s
    sound == "" ? num.to_s : sound
  end
end
