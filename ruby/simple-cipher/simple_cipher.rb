class SimpleCipher
  @key

  def initialize(key = "")
    @key = key ? key : ("a".."z").to_a.sample(100).join
  end

  def key
    @key
  end

  def change(text, encode)
    keys = @key.chars
    letters = text.chars
    output = ""
    (0...letters.size).each do |i|
      if encode
        ascii = letters[i].to_i + keys[i].to_i - 'a'.to_i
        if ascii > 'z'.to_i
          ascii -= 26
        end
      else
        ascii = letters[i].to_i - keys[i].to_i - 'a'.to_i
        if ascii < 'a'.to_i
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
