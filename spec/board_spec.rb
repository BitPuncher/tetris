require './src/board.rb'

describe Board do
	describe '#constructor' do
		let(:board) { Board.new }

		it 'has a valid constructor' do
			expect(board).to be_an_instance_of(Board)
		end

		it 'defaults to 10x20 in size' do
			expect(board.height).to be(22)
			expect(board.width).to be(10)
		end

		let (:custom_board) { Board.new(5, 10) }

		it 'takes a height and width' do
			expect(custom_board.height).to be(10)
			expect(custom_board.width).to be(5)
		end
	end

	describe '#slide_current_piece' do
		let(:board) { Board.new }

		it 'can move the current piece left and right' do
			initial_location = board.current_piece_position
			board.slide_current_piece('left')
			expect(board.current_piece_position).to eq([initial_location[0] - 1, initial_location[1]])

			board.slide_current_piece('right')
			expect(board.current_piece_position).to eq(initial_location)
		end
		it 'cannot move the piece beyond the board edges' do
			(board.width + 1).times { board.slide_current_piece('left') }

			expect(board.current_piece_position).to eq([0, board.height - 1])
		end
	end

	describe '#get_next_piece' do
		let(:board) { Board.new }

		it 'switches next_piece to current_piece and gets new next_piece' do
			next_piece = board.next_piece
			board.get_next_piece
			expect(board.current_piece).to be(next_piece)
			expect(board.next_piece).to_not be(next_piece)
		end
	end

	describe '#drop_current_piece' do
		let(:board) { Board.new }

		it 'drops the current piece until it cannot drop further' do
			board.drop_current_piece
			expect(board.current_piece).to be_nil
			expect(board.occupied_at?([board.width / 2, 0])).to be_true
		end
	end

	
end