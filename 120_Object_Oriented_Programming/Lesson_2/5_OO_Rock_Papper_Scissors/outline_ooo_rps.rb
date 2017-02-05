# step 1: desribe the problem

# Rock, Paper, Scissors is a two-player game where each player chooses one of 
# three possible moves: rock, paper, or scissors. The chosen moves will then be 
# compared to see who wins, according to the following rules:

# - rock beats scissors
# - scissors beats paper
# - paper beats rock

# If the players chose the same move, then it's a tie.

# step 2: extract major nouns and verbs

# nouns: player, move, rule 
# verbs: choose, compare

# step 3: organize the verbs with the nouns

# player
#   - choose
# move
# rule

#   - compare

class Player
  def initialize
    # maybe a "name"? what about a "move"?
  end
  
  def choose
    
  end
end

class Move
  def initialize
    # something to keep track
    # of the choice... a move object can be "paper", "rock" or "scissors"
  end
end

class Rule
  def initialize
    # not sure what the "state" of a rule object should be
  end
end

# not sure where "compare" goes yet

def compare(move1, move2)
  
end

step 4: orchestration engine

class RPSGame
  def initialize
  
  end
  
  def play
    display_welcome_message
    human.choose #part of "Player" class with "choose" method
    computer.choose #part of "Player" class with "choose" method
    display_winner
    display_goodbye_message
  end
end

RPSGame.new.play

step 5: define objects in play method that are required for faciliating the game

