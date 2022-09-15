# frozen_string_literal: true

require_relative 'grid'
require_relative 'player'

# class for Tic-Tac_Toe game
class TicTacToe
	def initialize
		@player1 = get_player(1)
		@player2 = get_player(2)
		@turn_number = 1
		@grid = Grid.new()
	end

	def start_game
		@grid.print_grid()
		player_turn() until @grid.check_winner(@player1, @player2) or @turn_number == 10
		end_game(@grid.check_winner(@player1, @player2))
	end

	def get_player(number)
		puts "Enter name for player #{number}: "
		name = gets.chomp
		puts "Choose symbol for player #{number}:"
		symbol = gets.chomp
		Player.new(name, symbol)
	end

	def player_turn
		player = @turn_number.odd? ? @player1 : @player2
    @grid.update(player_choice(player), player.symbol)
		@turn_number += 1
	end

  def player_choice(player)
    choice = nil
    until @grid.choices.include?(choice) do
			puts "#{player.name}'s turn, choose a number on the grid:"
			choice = gets.chomp.to_i - 1
		end
    choice
  end

	def end_game(winner)
		if winner.nil?
			puts "No winner"
		else
			puts "#{winner.name} wins!"
		end
    TicTacToe.new.start_game if play_again?
	end

  def play_again?
    puts "Enter 'y' to play again or any other key to stop playing."
    choice = gets.chomp.downcase
    if choice == 'y'
      TicTacToe.new.start_game
    else
      puts 'Thank you for playing!'
    end
  end
end

