class HumanPlayer	
	def prompt
		puts "Please enter the position of the card you'd like to flip (e.g., '2,3')"
		gets.chomp.split(',').map(&:to_i)
	end
end
