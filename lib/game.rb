# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# A class to create the game, with a board and two players
class Game
  def initialize
    @board = Board.new
    @player_one = Player.new
    @player_two = Player.new
    @current_player = nil
    @moves = 0
  end

  def start
    puts "\nThe game begins!"
    until game_over?
      if tie?
        puts "\nGame over! No more moves to be made, the game ends in a tie."
        return
      end
      switch_player unless @moves >= 9
      @board.print_board
      @board.place_sign(@current_player)
      @moves += 1
      puts 'Switching players' unless @moves
    end
    @board.print_board
    puts "\nCongratulations #{@current_player.name} on the victory!"
  end

  def switch_player
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end

  def game_over?
    @board.winning_combinations?
  end

  def tie?
    @moves >= 9
  end
end
