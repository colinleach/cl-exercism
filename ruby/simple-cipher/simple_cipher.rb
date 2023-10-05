class Cipher
  attr_accessor :key

  def initialize(key = nil)
    if key.nil?
      @key = ("a".."z").to_a.sample(100).join
    else
      unless /[a-z]+/.match(key)
        raise ArgumentError.new("Key must only contain lowercae letters")
      end
      @key = key
    end
  end

  def change(text, encode)
    keys = @key.chars.to_a
    letters = text.chars.to_a
    output = ""
    (0...letters.size).each do |i|
      if encode
        ascii = letters[i].ord + keys[i].ord - 'a'.ord
        if ascii > 'z'.ord
          ascii -= 26
        end
      else
        ascii = letters[i].ord - keys[i].ord + 'a'.ord
        if ascii < 'a'.ord
          ascii += 26
        end
      end
      output += ascii.chr
    end
    output
  end

  def encode(text)
    change(text, true)
  end

  def decode(text)
    change(text, false)
  end
end
