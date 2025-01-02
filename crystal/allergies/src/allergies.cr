class Allergies
    ALLERGENS = {
      "eggs" => 1,
      "peanuts" => 2,
      "shellfish" => 4,
      "strawberries" => 8,
      "tomatoes" => 16,
      "chocolate" => 32,
      "pollen" => 64,
      "cats" => 128
    }

    def self.allergic_to(allergen, score)
      score = score % 256
      score & ALLERGENS[allergen] != 0
    end

    def self.list(score)
      score = score % 256
      allergies = [] of String
      ALLERGENS.each { |k, _|
        allergic_to(k, score) && allergies.push k
      }
      allergies
    end
  end
