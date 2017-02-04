NOUNS      = %w(elephant teacher monkey ice door moon).freeze
ADJECTIVES = %w(lazy crazy shaved sleepy gigantic).freeze
VERBS      = %w(kicks screams jumps sings).freeze
ADVERBS    = %w(quickly slowly easily fully sadly).freeze

File.open('text.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end