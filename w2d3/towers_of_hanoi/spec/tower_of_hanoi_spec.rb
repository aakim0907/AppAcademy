require 'rspec'
require 'tower_of_hanoi'


describe Tower do
  subject(:game) { Tower.new }

  describe '#initialize' do
    it 'initializes grid with 3 subarrays populated with disc in the first' do
      expect(game.grid).to eq([[3,2,1],[],[]])
    end

  end

  describe '#move' do
    it 'moves a disc to a different pile' do
      expect(game.move([0,1])).to eq([[3,2],[1],[]])
    end

    it 'checks to make sure move is valid' do
      example = Tower.new([[3],[2],[1]])
      expect {example.move([0, 1])}.to raise_error("No! Can't move!")
    end

    it 'ensure takes an array with two indices as an argument' do
      example_arg = [1,2,3]
      expect { game.move(example_arg) }.to raise_error("invalid argument")
    end

  end

  describe '#won?' do
    it 'checks to see if pile is moved to different subarray' do
      game = Tower.new([[],[3,2,1],[]])
      expect(game.won?).to eq(true)
    end

  end

end
