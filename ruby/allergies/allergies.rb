class Allergies
  ALLERGENS = {
    'eggs' => 1,
    'peanuts' => 2,
    'shellfish' => 4,
    'strawberries' => 8,
    'tomatoes' => 16,
    'chocolate' => 32,
    'pollen' => 64,
    'cats' => 128
  }

  def initialize(score)
    @score = score % 256
  end

  def allergic_to?(allergen)
    @score & ALLERGENS[allergen] != 0
  end

  def list
    allergies = []
    ALLERGENS.each { |k, _|
      allergic_to?(k) and allergies.push k
    }
    allergies
  end
end
