class Atbash
  PLAIN = ('a'..'z').to_a
  CIPHER = PLAIN.reverse
  DIGITS = ('0'..'9').to_a

  def self.encode(input)
    raw = (input.downcase.chars.map { |chr| convert(chr, true) }).join
    group_by_5(raw)
  end

  def self.decode(input)
    (input.downcase.chars.map { |chr| convert(chr, false) }).join
  end

  def self.convert(chr, encode)
    return chr.to_s if DIGITS.include?(chr)

    if encode
      inx = PLAIN.index(chr)
      inx ? CIPHER[inx].to_s : ''
    else # decode
      inx = CIPHER.index(chr)
      inx ? PLAIN[inx].to_s : ''
    end
  end

  def self.group_by_5(raw)
    raw.size <= 5 ? raw : raw[...5] + ' ' + group_by_5(raw[5..])
  end
end