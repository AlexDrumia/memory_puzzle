class ComputerPlayer
	attr_accessor :known_cards
	
	def initialize
		@known_cards = {}
		@matched_cards = []
	end

	def prompt
		if @known_cards.size.even?
			puts "Mr. SuperadvancedAI, please enter the 1st position of the card you'd like to flip (e.g., '2,3')"
			sleep(2)
			[0,0]
		else
			puts "Mr. SuperadvancedAI, please enter the 2st position of the card you'd like to flip (e.g., '2,3')"
			sleep(2)
			[0,1]
		end
	end

	def receive_revealed_card(pos, card_value)
		@known_cards[pos] = card_value
	end
end

