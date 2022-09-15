# frozen_string_literal: true

# grid class for Tic-Tac-Toe
class Grid
	attr_reader :choices
	def initialize
		@grid = (1..9).to_a
		@choices = (0..8).to_a
		@lines = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
	end

	def update(choice, symbol)
		@grid[choice] = symbol
		print_grid()
		update_choices(choice)
	end

	def print_grid()
		@grid.each_index do |index|
			print " #{@grid[index]} |"
			if index == 2 || index == 5
				puts "\n---+---+---"
			end
		end
		puts ""
	end

	def update_choices(choice)
		@choices.delete(choice)
	end

	def check_winner(*players)
		players.each do |player|
			@lines.each do |line|
        return player if winning_line?(line, player)
      end
    end
    nil
	end

  def winning_line?(line, player)
    matches = 0
    line.each do |square|
      matches += 1 if @grid[square] == player.symbol
      return true if matches == 3
    end
    false
  end

end