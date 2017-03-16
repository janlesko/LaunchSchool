# def birds_method(ary)
#   yield(ary)
# end

# birds = %w(raven finch hawk eagle)

# birds_method(birds) { |bird| puts "Two birds of prey are #{bird[-2..-1].join(' and ')}." }


def birds_method(ary)
  yield(ary)
end

birds = %w(raven finch hawk eagle)

birds_method(birds) { |_, _, *birds_of_prey| puts "Two birds of prey are #{birds_of_prey.join(' and ')}." }
