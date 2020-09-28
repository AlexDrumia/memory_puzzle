class Card
	attr_accessor :face_up, :face_value

	def initialize
		@face_value = 'G'
		@face_up = true
	end

	def display
		if @face_up
			puts @face_value
		else
			puts ""
		end
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

	def to_s
	end
end

