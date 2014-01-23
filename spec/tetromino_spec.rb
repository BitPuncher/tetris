require './src/tetromino.rb'

describe Tetromino do
	describe '#constructor' do
		it 'returns a new tetromino' do
			expect(Tetromino.new.class).to eq(Tetromino)
		end

		it 'defaults to O tetromino' do
			expect(Tetromino.new.shape).to eq("O")
		end

		it 'only allows valid shapes' do
			expect { Tetromino.new("U") }.to raise_error("Invalid shape given.")
		end
	end

	describe '#rotate' do
		it 'can rotate left and right'
	end
end