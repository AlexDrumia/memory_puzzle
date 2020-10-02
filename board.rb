load 'card.rb'

class Board
	def initialize
		@grid = Array.new(4) { [] } 
	end

	def populate
		arr_of_cards = cards
		@grid.map! { |row| arr_of_cards.slice!(0,4) }
	end

	def render
		@grid.map do |row| 
			puts row.map { |card| card.display }.join(' ')
		end
	end

	def guessed_pos
		puts "Please enter the position of the card you'd like to flip (e.g., '2,3')"
		pos = gets.chomp.split(',').map(&:to_i)
	end

	private
	
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

