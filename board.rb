require_relative 'card'

class Board
	attr_accessor :grid

	def initialize
		@grid = Array.new(3) { Array.new(3) { Card.new } }
	end

	def render
		@grid.map do |row| 
			puts row.map { |card| card.display }.join(' ')
		end
	end
end

