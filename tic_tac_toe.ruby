# frozen_string_literal = true

require 'pry-byebug'
# creates a class to hold all the possible values from the game
class PlaySquare
  @@next_position = 0
  def initialize
    @position = @@next_position
    @@next_position += 1
    @value = 0
  end

  def play_turn(play)
    case play
    when 0
      @value = @position
    when 1
      @value = 'X'
    when 2
      @value = 'O'
    end
  end

  def print_board
    " | | \n | | \n | | ".split('').to_a
  end
end

def game_start
  puts "Welcome to the classic tic tac toe\nIt's a two player game. You only need to type a valid number corresponding"
  puts 'to where you following this grid:'
  puts "1|2|3\n4|5|6\n7|8|9"
  puts print_board
end

printf game_start