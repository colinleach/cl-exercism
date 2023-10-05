class SimpleCipher
  @key : String = ""

  def initialize(key = nil)
    @key = key.nil? ? ('a'..'z').to_a.sample(100).join : key
  end

  def key
    @key
  end

  def change(text, encode?)
    while @key.size < text.size
      @key += @key
    end

    keys = @key.chars.to_a
    letters = text.chars.to_a
    output = ""
    (0...letters.size).each do |i|
      if encode?
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

  def encode(text : String)
    change(text, true)
  end

  def decode(text : String)
    change(text, false)
  end
end
