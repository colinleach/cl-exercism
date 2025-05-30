module Chess
  RANKS = 1..8
  FILES = 'A'..'H'

  def self.valid_square?(rank, file)
    RANKS.includes?(rank) && FILES.includes?(file)
  end

  def self.nickname(first_name, last_name)
    (first_name[0..1] + last_name[-2..-1]).upcase
  end

  def self.move_message(first_name, last_name, square)
    nickname = nickname(first_name, last_name)
    succeed = "#{nickname} moved to #{square}"
    fail = "#{nickname} attempted to move to #{square}, but that is not a valid square"
    valid_square?(square[1].to_i, square[0]) ? succeed : fail
  end
end
