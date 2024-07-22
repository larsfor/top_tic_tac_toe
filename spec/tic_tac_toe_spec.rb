# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/player'

describe 'Tic Tac Toe board' do
  describe '#initialize' do
    it 'creates a board' do
      board = Board.new
      expected_result = Array.new(9) { |i| (i + 1) }
      expect(board.board).to eq(expected_result)
    end
  end
end
