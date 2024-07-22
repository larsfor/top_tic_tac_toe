# frozen_string_literal: true

# A class to create the board to play on
class Board
  attr_accessor :board
  attr_reader :winning_combinations

  def initialize
    @board = Array.new(9) { |i| (i + 1) }
  end

  def place_sign(player)
    placement = ''
    until valid_placement?(placement)
      puts "It's #{player.name}'s turn. Place your sign (1 - 9)."
      placement = gets.chomp.to_i
    end
    @board[placement - 1] = player.sign
  end

  def valid_placement?(placement)
    return false unless placement.instance_of? Integer

    board[placement - 1].instance_of? Integer
  end

  def winning_combinations?
    return true if horizontal_winning?
    return true if vertical_winning?
    return true if cross_winning?

    false
  end

  def horizontal_winning?
    b = @board
    return true if b[0] == b[1] && b[0] == b[2]
    return true if b[3] == b[4] && b[3] == b[5]
    return true if b[6] == b[7] && b[6] == b[8]

    false
  end

  def vertical_winning?
    b = @board
    return true if b[0] == b[3] && b[0] == b[6]
    return true if b[1] == b[4] && b[1] == b[7]
    return true if b[2] == b[5] && b[2] == b[8]

    false
  end

  def cross_winning?
    b = @board
    return true if b[0] == b[4] && b[0] == b[8]
    return true if b[2] == b[4] && b[2] == b[6]

    false
  end

  def print_board
    b = @board
    puts ' ------------'
    puts "| #{b[0]} | #{b[1]} | #{b[2]} |"
    puts ' ------------'
    puts "| #{b[3]} | #{b[4]} | #{b[5]} |"
    puts ' ------------'
    puts "| #{b[6]} | #{b[7]} | #{b[8]} |"
    puts ' ------------'
  end
end
