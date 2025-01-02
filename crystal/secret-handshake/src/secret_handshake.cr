module SecretHandshake
  def self.commands(input : Number) : Array(String)
    num = input % 32
    responses = ["wink", "double blink", "close your eyes", "jump"]
    actions = [] of String
    (0..3).each { |i| actions.push(responses[i]) if num & (1 << i) != 0 }
    1 << 4 & num == 0 ? actions : actions.reverse
 end
end
