module RunLengthEncoding

  def self.to_append(count, prev_char)
    num = (count > 1) ? count.to_s : ""
    prev_char.nil? ? "" : num + prev_char
  end

  def self.encode(input : String) : String
    return "" if input == ""

    prev_char = nil
    count = 1
    output = ""
    input.each_char do |c|
      if c == prev_char
        count += 1
      else
        output += to_append(count, prev_char)
        prev_char = c
        count = 1
      end
    end
    output + to_append(count, prev_char)
  end

  def self.decode(input : String) : String
    number = ""
    output = ""
    input.each_char do |c|
      if c.number?
        number += c
      else
        repeats = (number == "") ? 1 : number.to_i
        output += (c.to_s * repeats)
        number = ""
      end
    end
    output
  end

end
