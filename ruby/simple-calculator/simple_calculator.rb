class SimpleCalculator
  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    unless (first_operand.is_a? Numeric) && (second_operand.is_a? Numeric)
      raise ArgumentError.new("operands must be numeric")
    end

    calc = "#{first_operand} #{operation} #{second_operand} = "
    case operation
    when '+'
      calc + "#{first_operand + second_operand}"
    when '/'
      second_operand == 0 ? "Division by zero is not allowed." :
        calc + "#{first_operand / second_operand}"
    when '*'
      calc + "#{first_operand * second_operand}"
    else
      raise UnsupportedOperation.new("Invalid operation")
    end
  end
end
