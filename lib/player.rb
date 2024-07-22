# frozen_string_literal: true

# A class to create players and their sign
class Player
  attr_reader :name, :sign

  @number_of_players = 1
  @signs = []

  def initialize
    @name = create_player
    @sign = choose_sign(Player.number_of_players)
    Player.number_of_players += 1
  end

  def create_player
    puts if Player.number_of_players > 1
    puts "Player #{Player.number_of_players}, what is your name?"
    name = gets.chomp
    create_player if name.length.zero?
    name
  end

  def choose_sign(number)
    puts
    sign = ''
    until valid_sign?(sign)
      puts "Player #{number}, which sign do you choose ('o' or 'x')?"
      puts "The sign can't be the same as the opponent."
      sign = gets.chomp
    end
    Player.signs.push(sign)
    sign
  end

  def valid_sign?(sign)
    return false if Player.signs.include?(sign)

    %w[o x].include?(sign)
  end

  # To access class instance variables
  class << self
    attr_accessor :number_of_players, :signs
  end
end
