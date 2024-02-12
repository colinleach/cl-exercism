class Raindrops
  def self.convert(n)
    sound = ""
    sound.concat("Pling") if n % 3 == 0
    sound.concat("Plang") if n % 5 == 0
    sound.concat("Plong") if n % 7 == 0
    sound == "" ? n.to_s : sound
  end
end