# class WordProblem
#   OPERATORS = { 'plus' => '+', 'minus' => '-', 
#                 'multiplied' => '*', 'divided' => '/' }

#   def initialize(word_problem)
#     raise ArgumentError if OPERATORS.keys.none? { |op| word_problem.match(op) }
#     @word_problem = word_problem.match(/-?\d.*\d/)[0].delete('by').split
#   end

#   def answer
#     while @word_problem.size > 1
#       num1, operator, num2 = @word_problem.shift(3)
#       @word_problem.unshift(num1.to_i.send(OPERATORS[operator], num2.to_i))
#     end
#     @word_problem.first
#   end
# end

class WordProblem
  OPERATORS = { 'plus' => '+', 'minus' => '-', 
                'multiplied' => '*', 'divided' => '/' }

  attr_reader :numbers, :operations

  def initialize(word_problem)
    @numbers = word_problem.scan(/-?\d+/).map(&:to_i)
    @operations =  word_problem.scan(/(plus|minus|multiplied|divided)/).flatten

    raise ArgumentError if @numbers.empty? || @operations.empty?
  end

  def answer
    operations.each_with_index.reduce(numbers.first) do |result, (op, idx)|
      result.send(OPERATORS[op], numbers[idx + 1])
    end
  end
end

problem = WordProblem.new('What is 17 minus 6 plus 3?')


p problem.answer