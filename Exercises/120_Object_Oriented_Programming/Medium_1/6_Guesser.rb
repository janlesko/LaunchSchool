# class PingGame
#   def initialize
#     @secret_number = rand(100)
#     @remaining_guesses = 7
#     @user_number = 0
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
#     initialize
#   end
  
#   def prompt_number
#     loop do
#       puts "Enter a number between 1 and 100:"
#       @user_number = gets.chomp.to_i
#       break if @user_number.between?(1, 100)
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

class PingGame
  MAX_GUESSES = 7
  RANGE = 1..100
  RESULT_MESSAGE = { high: 'Your number is too high.',
                     lose: 'You are out of guesses. You lose.',
                     low: 'Your number is too low.',
                     win: 'You win!' }
   
  def play
    reset
    MAX_GUESSES.downto(1) do |remaining_guesses|
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
      print "Enter a number between #{RANGE.first} and #{RANGE.last}: "
      guess = gets.chomp.to_i
      return guess if RANGE.cover?(guess)
      print "Invalid guess. "
    end
  end
  
  def reset
    @secret_number = rand(RANGE)
  end
end

game = PingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# You win!

game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low
# You are out of guesses. You lose.