class Luhn
  def self.valid?(text)
    /[^ 0-9]/.match(text) and return false
    digits = (text.gsub(/\s+/, "").each_char.map {|c| c.to_i }).reverse
    digits.length > 1 or return false
    fixed = digits.each.with_index.map { |d, i| i.odd? ? double_with_limit(d) : d }
    fixed.sum % 10 == 0
  end

  private

  def self.double_with_limit(d)
    d > 4 ? d * 2 - 9 : 2 * d
  end
end
