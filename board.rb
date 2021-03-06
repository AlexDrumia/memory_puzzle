require_relative 'card.rb'

class Board
	def initialize
		@grid = Array.new(4) { [] } 
		populate_board
	end

	def render
		puts '  0 1 2 3'
		@grid.each.with_index do |row, i| 
			puts i.to_s + ' ' + row.map { |card| card.display }.join(' ')
		end
		nil
	end

	def won?
		@grid.flatten.all? { |card| card.face_up }
	end

	def reveal(pos)
		card = self[pos]
		if !card.face_up
			card.reveal
			card.face_value
		end
	end

	def [](pos)
		row, col = pos
		@grid[row][col]
	end

	private

	def populate_board
		arr_of_cards = cards
		@grid.map! { |row| arr_of_cards.slice!(0,4) }
	end
	
	def cards
		full_shuffle.map { |letter| Card.new(letter) }
	end

	def full_shuffle 
		arr = half_shuffle 
		arr += arr
		arr.shuffle
	end
	
	def half_shuffle
		letters = []
		while letters.size < 8
			letter = abc.sample
			letters << letter if !letters.include?(letter)
		end
		letters
	end

	def abc
		('A'..'Z').to_a
	end
end

