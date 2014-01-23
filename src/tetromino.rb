class Tetromino
	attr_accessor :shape

	SHAPE_MATRIX = { 'O' => [[true, true], [true, true]]}

	def initialize shape = "O"
		raise "Invalid shape given." if !SHAPE_MATRIX.keys.include?(shape)

		@shape = shape
	end

	def shape_matrix
		SHAPE_MATRIX[@shape]
	end
end