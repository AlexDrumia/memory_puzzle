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
			pos = @board.prompt
			make_guess(pos)
		end
		puts "Game over!"
	end

	def make_guess(pos)
		if @previous_guess == nil
			@board.guessed_pos = pos
			@board.reveal(@board.guessed_pos)
			@previous_guess = pos
		else
			@board.guessed_pos = pos
			prev_card = @board[@previous_guess]
			curr_card = @board[@board.guessed_pos]
			if curr_card == prev_card
				curr_card.reveal
				prev_card.reveal
				@previous_guess = nil
				system("clear")
				@board.render
			else
				curr_card.reveal
				prev_card.reveal
				system("clear")
				@board.render	
				sleep(3)
				curr_card.hide
				prev_card.hide
				@previous_guess = nil
			end
		end
	end

	def over
		@board.won?
	end
end
