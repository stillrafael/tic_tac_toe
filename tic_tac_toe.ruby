# frozen_literal_string = true
require 'pry-byebug'
# creates a class to hold all the possible values from the game

def print_board
  " | | \n | | \n | | ".split('').to_a
end

def game_start
  puts 'Welcome to Tic-Tac-Toe'
  puts 'Input a number from 1 to 9 to select your square'
  game_board = print_board
  puts game_board.join
  play_table = game_board.map.with_index { |square, index| square == ' ' ? index : next }.compact
  round_start(game_board, play_table)
end

def round_start(board, map)
  player_one_turn = true
  round_counter = []
  game_end = false
  while game_end == false
    puts 'Type the square you would like to play'
    player_move = gets.chomp
    if round_counter.any?(player_move)
      puts 'Invalid square'
    else
      round_counter << player_move
      play_round(map, player_move, player_one_turn, board)
      puts player_one_turn ? 'player one' : 'player two'
      player_one_turn = !player_one_turn
      puts board.join
      game_end = win?(board)
    end
  end
  puts 'game over'
end

def play_round(map, player_move, player, board)
  calculate_player_square = player_move.to_i - 1
  player_move_symbol = player ? 'X' : 'O'
  board[map[calculate_player_square]] = player_move_symbol
  board
end

def win?(board)
  win_condition = [[0, 2, 4], [6, 8, 10], [12, 14, 16], [0, 6, 12], [2, 8, 14], [4, 10, 16], [0, 8, 12], [4, 8, 12]]
  win_condition.any? do |win|
    winning_position = [board[win[0]], board[win[1]], board[win[2]]]
    case winning_position
    when %w[O O O]
      true
    when %w[X X X]
      true
    end
  end
end

game_start
