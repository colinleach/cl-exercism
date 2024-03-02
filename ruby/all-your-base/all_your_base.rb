class BaseConverter
  def self.convert(input_base, digits, output_base)
    unless input_base > 1 && output_base > 1 && digits.all? { |d| d >= 0 && d < input_base }
      raise ArgumentError
    end
    number = 0
    digits.each { |digit| number = input_base * number + digit }
    digits_out = []
    while number > 0
      digits_out = digits_out.push(number % output_base)
      number = number / output_base
    end
    digits_out.length > 0 ? digits_out.reverse : [0]
  end
end
