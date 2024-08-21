
class FoodChain
  ANIMALS = %w[fly spider bird cat dog goat cow horse]
  LINE2 = ["",
           "It wriggled and jiggled and tickled inside her.\n",
           "How absurd to swallow a bird!\n",
           "Imagine that, to swallow a cat!\n",
           "What a hog, to swallow a dog!\n",
           "Just opened her throat and swallowed a goat!\n",
           "I don't know how she swallowed a cow!\n",
           "She's dead, of course!\n"]

  WRIGGLE = " that wriggled and jiggled and tickled inside her.\n"
  LAST = "I don't know why she swallowed the fly. Perhaps she'll die."

  def self.make_verse(number)
    verse = "I know an old lady who swallowed a #{ANIMALS[number]}.\n"
    verse << LINE2[number] unless ANIMALS[number] == "fly"

    return verse if ANIMALS[number] == "horse"

    (number - 1).downto(0).each { |v|
      line = "She swallowed the #{ANIMALS[v + 1]} to catch the #{ANIMALS[v]}"
      line << (ANIMALS[v] == "spider" ? WRIGGLE : ".\n")
      verse << line
    }
    verse << LAST
  end

  def self.song
    result = make_verse(0)
    ANIMALS.each do |animal|
      if animal != "fly"
        inx = ANIMALS.index(animal)
        result << "\n\n" << make_verse(inx)
        end
    end

    result
  end
end
