class SecretHandshake
  ENCODING = { 'wink' => 1, 'double blink' => 10, 'close your eyes' => 100,
               'jump' => 1_000, 'reverse' => 10_000 }.freeze

  def initialize(codes)
    @codes = codes.class == Fixnum ? codes.to_s(2).to_i : codes.to_i
  end

  def commands
    actions = []
    ENCODING.each { |act, code| actions << act if @codes / code % 10 == 1 }
    actions.last == 'reverse' ? actions[0..-2].reverse : actions
  end
end
