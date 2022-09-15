# frozen_string_literal: true

# Player class for Tic-Tac_toe
class Player
  attr_reader :name, :symbol
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end