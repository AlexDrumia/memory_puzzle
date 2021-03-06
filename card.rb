class Card
	attr_accessor :face_up, :face_value

	def initialize(letter)
		@face_value = letter
		@face_up = false
	end

	def display
		@face_up ?  @face_value : " "
	end

	def hide
		@face_up = false
	end

	def reveal
		@face_up = true
	end

	def ==(other)
		@face_value == other.face_value
	end
end

