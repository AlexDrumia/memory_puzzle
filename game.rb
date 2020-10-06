load 'board.rb'
load 'human_player.rb'
load 'computer_player.rb'

class Game
	def initialize
		@board = Board.new
		choose_player
		@previous_guess = nil
	end

	def play
		until over
			system("clear")
			@board.render
			make_guess(@player.prompt)
		end
		puts "Game over!"
	end

	def make_guess(pos)
		if @previous_guess == nil
			card_value = @board.reveal(pos)
			@player.receive_revealed_card(pos, card_value)
			@previous_guess = pos
		else
			prev_card, curr_card  = @board[@previous_guess], @board[pos]
			if curr_card == prev_card
				[curr_card, prev_card].each(&:reveal)
				system("clear")
				@board.render
				puts "It's a match!"
				sleep(2)
				@previous_guess = nil
			else
				[curr_card, prev_card].each(&:reveal)
				system("clear")
				@board.render	
				puts "Try again."
				sleep(3)
				[curr_card, prev_card].each(&:hide)
				@previous_guess = nil
			end
		end
	end

	def over
		@board.won?
	end

	private

	def choose_player
		puts "Please choose between human player or computer player (h/c)."
		if gets.chomp == "h"
			@player = HumanPlayer.new
		else
			@player = ComputerPlayer.new
		end
	end
end
