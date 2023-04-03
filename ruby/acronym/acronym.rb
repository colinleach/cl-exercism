module Acronym
  def self.abbreviate(input)
    input.upcase.gsub(/[^A-Z ]/, ' ').split(' ').map {|w| w[0]}.join
  end
end
