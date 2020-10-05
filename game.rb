load 'board.rb'

class Game
	def initialize
		@board = Board.new
		@previous_guess = nil
	end

	def play
		until over
			system("clear")
			@board.render
			make_guess(@board.prompt)
		end
		puts "Game over!"
	end

	def make_guess(pos)
		if @previous_guess == nil
			@board.reveal(pos)
			@previous_guess = pos
		else
			prev_card, curr_card  = @board[@previous_guess], @board[pos]
			if curr_card == prev_card
				[curr_card, prev_card].each(&:reveal)
				system("clear")
				@board.render
				@previous_guess = nil
			else
				[curr_card, prev_card].each(&:reveal)
				system("clear")
				@board.render	
				sleep(3)
				[curr_card, prev_card].each(&:hide)
				@previous_guess = nil
			end
		end
	end

	def over
		@board.won?
	end
end
