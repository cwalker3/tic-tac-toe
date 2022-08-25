class TicTacToe
	@@number_of_games = 0
	def initialize
		@@number_of_games += 1
		@player1 = get_player(1)
		@player2 = get_player(2)
		@turn_number = 1
		@grid = Grid.new()
	end

	def start_game
		@grid.print_grid()
		loop do
			player_turn()
			if @grid.check_winner(@player1, @player2) or @turn_number == 10
				break
			end
		end
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
		if @turn_number % 2 == 1
			player = @player1
		else
			player = @player2
		end
		loop do
			puts "#{player.name}'s turn, choose a number on the grid:"
			choice = gets.chomp.to_i - 1
			if @grid.choices.include?(choice)
				@grid.update(choice, player.symbol)
				break
			end
		end
		@turn_number += 1
	end

	def end_game(winner)
		if winner == nil
			puts "No winner"
		else
			puts "#{winner.name} wins!"
		end
	end

end

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

	def check_winner(player1, player2)
		players = [player1, player2]
		for player in players
			for line in @lines
				matches = 0
				for square in line
					if @grid[square] != player.symbol
						break
					else
						matches += 1
					end
			  end
				if matches == 3 
					return player
				end
			end
		end
		return nil
	end

end


class Player
		attr_reader :name, :symbol
  def initialize(name, symbol)
		@name = name
		@symbol = symbol
	end
end


game = TicTacToe.new
game.start_game()