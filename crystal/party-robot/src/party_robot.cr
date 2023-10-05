class PartyRobot
  def self.welcome(name : String) : String
    "Welcome to my party, #{name}!"
  end

  def self.happy_birthday(name : String, age : Int) : String
    "Happy birthday #{name}! You are now #{age} years old!"
  end

  def self.assign_table(name : String, direction : String, table : Int, distance : Float64, neighbor : String) : String
    line1 = self.welcome(name)
    line2 = "You have been assigned to table #{table}. "
    line2 += "Your table is #{direction}, exactly #{distance.round(1)} meters from here."
    line3 = "You will be sitting next to #{neighbor[0]}#{neighbor[-1]}."
    line1 + "\n" + line2 + "\n" + line3
  end
end
