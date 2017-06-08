require 'deck'

describe Deck do
  subject(:temp) { Deck.new }

  describe 'initialize' do
    it 'populates deck with 52 cards' do
      expect(temp.deck.length).to eq(52)
    end

  end


end
