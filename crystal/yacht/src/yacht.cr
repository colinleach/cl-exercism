module Yacht
  enum Category
    Yacht
    Ones
    Twos
    Threes
    Fours
    Fives
    Sixes
    FullHouse
    FourOfAKind
    LittleStraight
    BigStraight
    Choice
  end

  def self.score(dice, category)
    freqs = (1..6).map {|x| dice.count(x)}
    maxfreq = freqs.max

    case category
    when Category::Yacht
      (maxfreq == 5) ? 50 : 0
    when Category::Ones, Category::Twos, Category::Threes,
          Category::Fours, Category::Fives, Category::Sixes
      digit = category.value
      digit * freqs[digit - 1]
    when Category::FullHouse
      freqs.sort == [0, 0, 0, 0, 2, 3] ? dice.sum : 0
    when Category::FourOfAKind
      kind = freqs.index(maxfreq).as(Int32) + 1
      (maxfreq >= 4) ? 4 * kind : 0
    when Category::LittleStraight
      dice.sort == [1, 2, 3, 4, 5] ? 30 : 0
    when Category::BigStraight
      dice.sort == [2, 3, 4, 5, 6] ? 30 : 0
    when Category::Choice
      dice.sum
    end
  end
end
