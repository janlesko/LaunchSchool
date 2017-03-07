# class Guesser
#   def initialize(first, last)
#     @secret_number = rand(first..last)
#     @remaining_guesses = 10
#     @user_number = 0
#     @first = first
#     @last = last
#   end
  
#   def play
#     reset
#     loop do
#       display_remaining_guesses
#       prompt_number
#       evaluate_guess
#       break if @remaining_guesses.zero? || @user_number == @secret_number
#     end
#     puts "You are out of guesses. You lose." if @remaining_guesses.zero?
#   end
  
#   private
  
#   def display_remaining_guesses
#     puts "You have #{@remaining_guesses} guesses remaining."
#   end
  
#   def reset
#     initialize(@first, @last)
#   end
  
#   def prompt_number
#     loop do
#       puts "Enter a number between #{@first} and #{@last}:"
#       @user_number = gets.chomp.to_i
#       break if @user_number.between?(@first, @last)
#       puts "Not a valid entry."
#     end
#   end
  
#   def evaluate_guess
#     if @secret_number > @user_number
#       @remaining_guesses -= 1
#       puts "Your guess is too low"
#     elsif @secret_number < @user_number
#       @remaining_guesses -= 1
#       puts "Your guess is too high"
#     else
#       puts "You win"
#     end
#   end
# end

class Guesser
  MAX_GUESSES = 10
  RESULT_MESSAGE = { high: 'Your number is too high.',
                    lose: 'You are out of guesses. You lose.',
                    low: 'Your number is too low.',
                    win: 'You win!' }
  
  def initialize(lowest, highest)
    @range = lowest..highest
    @max_guesses = Math.log2(highest - lowest + 1).to_i + 1
  end
  
  def play
    reset
     @max_guesses.downto(1) do |remaining_guesses|
      display_remaining_guesses(remaining_guesses)
      result = check_guess(obtain_guess)
      puts RESULT_MESSAGE[result]
      return if result == :win
    end
    
    puts "\n", RESULT_MESSAGE[:lose]
  end
  
  private
  
  def display_remaining_guesses(remaining)
    puts 
    if remaining == 1
      puts 'Ypu have 1 guess remaining.'
    else
      puts "You have #{remaining} guesses remaining"
    end
  end
  
  def check_guess guess_value
    return :win if guess_value == @secret_number
    return :low if guess_value < @secret_number
    :high
  end
  
  def obtain_guess
    loop do
      print "Enter a number between #{@range.first} and #{@range.last}: "
      guess = gets.chomp.to_i
      return guess if @range.cover?(guess)
      print "Invalid guess. "
    end
  end
  
  def reset
    @secret_number = rand(@range)
  end
end

game = Guesser.new(501, 1500)
game.play

# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 104
# Invalid guess. Enter a number between 501 and 1500: 1000
# Your guess is too low

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 1250
# Your guess is too low

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 1375
# Your guess is too high

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 80
# Invalid guess. Enter a number between 501 and 1500: 1312
# Your guess is too low

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 1343
# Your guess is too low

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 1359
# Your guess is too high

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 1351
# Your guess is too high

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 1355
# You win!

game.play
# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 1000
# Your guess is too high

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 750
# Your guess is too low

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 875
# Your guess is too high

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 812
# Your guess is too low

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 843
# Your guess is too high

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 820
# Your guess is too low

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 830
# Your guess is too low

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 835
# Your guess is too low

# You have 2 guesses remaining.
# Enter a number between 501 and 1500: 836
# Your guess is too low

# You have 1 guesses remaining.
# Enter a number between 501 and 1500: 837
# Your guess is too low

# You are out of guesses. You lose.