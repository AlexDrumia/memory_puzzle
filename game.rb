require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'

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
			curr_card_val = @board.reveal(pos)
			@player.receive_revealed_card(pos, curr_card_val)
			@previous_guess = pos
		else
			if @board[@previous_guess] == @board[pos]
				@board.reveal(pos)
				@board.reveal(@previous_guess)
				@player.receive_match(pos, @previous_guess)
				match_render
			else
				curr_card_val = @board.reveal(pos)
				@player.receive_revealed_card(pos, curr_card_val)
				@board.reveal(@previous_guess)
				nonmatch_render
				@board[@previous_guess].hide
				@board[pos].hide
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

	def match_render
		system("clear")
		@board.render
		puts "It's a match!"
		sleep(2)
		@previous_guess = nil
	end

	def nonmatch_render
		system("clear")
		@board.render	
		puts "Try again."
		sleep(3)
	end
end

if __FILE__ == $PROGRAM_NAME
	Game.new.play
end

