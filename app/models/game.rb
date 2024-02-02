class Game < ApplicationRecord
  before_validation :initialize_board, on: :create

  after_update_commit :broadcast_game

  def broadcast_game
    broadcast_update_to self
  end

  def initialize_board
    self.board = {
      0 => { 0 => nil, 1 => nil, 2 => nil },
      1 => { 0 => nil, 1 => nil, 2 => nil },
      2 => { 0 => nil, 1 => nil, 2 => nil },
    }

    self.current_symbol = [:x, :o].sample
  end

  def get_symbol(row, col)
    self.board[row.to_s][col.to_s]
  end

  def play!(row, col)
    self.board[row.to_s][col.to_s] = current_symbol

    self.current_symbol = current_symbol == "x" ? "o" : "x"

    self.save!
  end
end
