class ComputerPlayer
	attr_accessor :known_cards, :matched_cards, :first_guess
	
	def initialize
		@known_cards = {}
		@matched_cards = []
		@first_guess = nil
	end

	def receive_revealed_card(pos, card_value)
		@known_cards[pos] = card_value
	end

	def receive_match(pos1, pos2)
		@matched_cards << [pos1, pos2]
	end

	def prompt
		@known_cards.size.even? ? first_guess : second_guess
	end


	def first_guess
		puts "Mr. SuperadvancedAI, please enter the 1st position of the card you'd like to flip (e.g., '2,3')"
		sleep(2)
		knows_matching_card? ? guess_matching_card : guess_randomly
	end

	def knows_matching_card?
		!matching_card.nil?
	end

	def matching_card
		cards_values = @known_cards.values
		cards_values.find { |value| cards_values.count(value) > 1 }
	end

	def guess_matching_card
		@first_guess = @known_cards.key(matching_card)
	end


	def second_guess
		puts "Mr. SuperadvancedAI, please enter the 2st position of the card you'd like to flip (e.g., '2,3')"
		sleep(2)
		first_guess_revealed_matched_location? ? guess_matched_location : guess_randomly
	end

	def first_guess_revealed_matching_card?
		@known_cards.value?()
	end

	def guess_matched_location
		@known_cards.key()
	end

	private

	def guess_randomly
		 known_positions = @known_cards.keys
		 random = random_pos
		 until !known_positions.include?(random)
			 random = random_pos
		 end
		 @first_guess = random
	end

	def random_pos
		[rand(0..3), rand(0..3)]
	end
end

