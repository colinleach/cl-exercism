class Library
  def self.first_letter(title : String) : Char
    title.chars[0]
  end

  def self.initials(first_name : String, last_name : String) : String
    "#{first_letter(first_name)}.#{first_letter(last_name)}"
  end

  def self.decrypt_character(character : Char) : Char
    c = character.ord - 1
    if !c.chr.letter?
      c += 26
    end
    c.chr
  end

  def self.decrypt_text(text : String) : String
    result = ""
    text.chars.each do |c|
      result += c.letter? ? decrypt_character(c) : c
    end
    result
  end
end
