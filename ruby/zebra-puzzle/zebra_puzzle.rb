class ZebraPuzzle
  @@colors = { :Red => 1, :Green => 2, :Ivory => 3, :Yellow => 4, :Blue => 5 }
  @@nationality = { :Englishman => 1, :Spaniard => 2, :Ukrainian => 3, :Norwegian => 4, :Japanese => 5 }
  @@pets =  { :Dog => 1, :Snails => 2, :Fox => 3, :Horse => 4, :Zebra => 5 }
  @@drinks = { :Coffee => 1, :Milk => 2, :Orange => 3, :Tea => 4, :Water => 5 }
  @@hobbies = { :Dancing => 1, :Reading => 2, :Painting => 3, :Football => 4, :Chess => 5 }

  def self.solve
    perms = [1, 2, 3, 4, 5].permutation.to_a

    result = []

    # 10: The Norwegian lives in the first house
    nation_iter = perms.select { |nation| nation[0] == @@nationality[:Norwegian] }
    nation_iter.each do |nation|

      # 2: The Englishman lives in the red house
      # 6: The green house is immediately to the right of the ivory house
      # 15: The Norwegian lives next door to the blue house
      color_iter = perms.select do |color|
        nation.index(@@nationality[:Englishman]) == color.index(@@colors[:Red]) &&
          color.index(@@colors[:Green]) == color.index(@@colors[:Ivory]) + 1 &&
          ( nation.index(@@nationality[:Norwegian]) - color.index(@@colors[:Blue]) ).abs == 1
      end
      color_iter.each do |color|

        # 4: The person in the green house drinks coffee
        # 5: The Ukrainian drinks tea
        # 9: The person in the middle house drinks milk
        drink_iter = perms.select do |drink|
          color.index(@@colors[:Green]) == drink.index(@@drinks[:Coffee]) &&
            nation.index(@@nationality[:Ukrainian]) == drink.index(@@drinks[:Tea]) &&
            drink[2] == drink.index(@@drinks[:Milk])
        end
        drink_iter.each do |drink|

          # 3: The Spaniard owns the dog
          animal_iter = perms.select do |animal|
            nation.index(@@nationality[:Spaniard]) == animal.index(@@pets[:Dog])
          end
          animal_iter.each do |animal|

            # 7: The snail owner likes to go dancing
            # 8: The person in the yellow house is a painter
            # 11: The person who enjoys reading lives in the house next to the person with the fox
            # 12: The painter's house is next to the person with the horse
            # 13: The person who plays football drinks orange juice
            # 14: The Japanese person plays chess
            hobby_iter = perms.select do |hobby|

              animal.index(@@pets[:Snails]) == hobby.index(@@hobbies[:Dancing]) &&
                color.index(@@colors[:Yellow]) == hobby.index(@@hobbies[:Painting]) &&
                (hobby.index(@@hobbies[:Reading]) - animal.index(@@pets[:Fox])).abs == 1 &&
                (hobby.index(@@hobbies[:Painting]) - animal.index(@@pets[:Horse])).abs == 1 &&
                hobby.index(@@hobbies[:Football]) == drink.index(@@drinks[:Orange]) &&
                nation.index(@@nationality[:Japanese]) == hobby.index(@@hobbies[:Chess])
            end
            hobby_iter.each do |hobby|
              result << [nation, color, drink, animal, hobby]
            end
          end
        end
      end
    end
    result[0]
  end

  def self.water_drinker
    nation, _, drink, _, _ = solve
    water_index = drink.index(@@drinks[:Water])
    nation_index = nation[water_index]
    @@nationality.key(nation_index).to_s
  end

  def self.zebra_owner
    nation, _, _, animal, _ = solve
    animal_index = animal.index(@@pets[:Zebra])
    nation_index = nation[animal_index]
    @@nationality.key(nation_index).to_s
  end
end