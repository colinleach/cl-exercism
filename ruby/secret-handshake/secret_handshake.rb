class SecretHandshake
  def initialize(input)
    @num = input.is_a?(Integer) ? input % 32 : 0
  end

  def commands
    responses = ['wink', 'double blink', 'close your eyes', 'jump']
    actions = []
    (0..3).each { |i| actions.push(responses[i]) if @num & (1 << i) != 0 }
    1 << 4 & @num == 0 ? actions : actions.reverse
  end
end
