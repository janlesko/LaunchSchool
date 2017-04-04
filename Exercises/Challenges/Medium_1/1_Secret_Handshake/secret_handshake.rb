class SecretHandshake
  ENCODING = { "wink" => 1, "double blink" => 10, "close your eyes" => 100,
               "jump" => 1000, "reverse" => 10000 }

  def initialize(codes)
    @codes = codes.class == Fixnum ? codes.to_s(2).to_i : codes.to_i
  end

  def commands
    actions = []
    ENCODING.each { |action, code| actions << action if @codes / code % 10 == 1 }
    actions.last == "reverse" ? actions[0..-2].reverse : actions
  end
end

handshake = SecretHandshake.new "11901"

p handshake.commands
