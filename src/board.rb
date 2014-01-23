class Board
	attr_reader :current_piece_position, :current_piece, :next_piece

	def initialize width = 10, height = 22
		@grid = Array.new(width) { Array.new(height) }
		@current_piece = Tetromino.new
		@next_piece = Tetromino.new
		@current_piece_position = [width / 2, height - 1]

		move_piece_to_position @current_piece_position
	end

	def height
		@grid[0].length
	end

	def width
		@grid.length
	end

	def slide_current_piece direction
		delta = direction == 'left' ? -1 : 1
		move_piece_to_position [@current_piece_position[0] + delta, @current_piece_position[1]]
	end

	def move_piece_to_position position
		if valid_move? position
			@current_piece_position = position
			true
		else
			false
		end
	end

	def get_next_piece
		@current_piece = @next_piece
		@next_piece = Tetromino.new
		@current_piece_position = [width / 2, height - 1]
	end

	def drop_current_piece
		until !valid_move?([current_piece_position[0], current_piece_position[1] - 1])
			current_piece_position[1] -= 1
		end

		write_piece_to_board
		@current_piece = nil
	end

	def occupied_at? position
		@grid[position[0]][position[1]]
	end

	private

	def valid_move? position
		(0..width).include?(position[0]) && (0..height).include?(position[1]) &&
			current_piece_fits_at?(position)
	end

	def current_piece_fits_at? position
		matrix = @current_piece.shape_matrix
		matrix.each_with_index do |el, col|
			el.each_index do |row|
				return false if @grid[position[0] + col][position[1] + row] && matrix[col][row]
			end
		end
		true
	end

	def write_piece_to_board
		matrix = @current_piece.shape_matrix
		position = @current_piece_position

		matrix.each_with_index do |el, col|
			el.each_index do |row|
				@grid[position[0] + col][position[1] + row] = true if matrix[col][row]
			end
		end
		true
	end
end