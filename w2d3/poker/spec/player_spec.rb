require 'player'


describe Player do

  subject(:player) { Player.new("example") }
  describe '#initialize' do
    it 'empty hand instance variable' do
      expect(player.hand).to eq(Array.new(5))
    end

    it 'initializes a players name as instance variable' do
      expect(player.name).to eq("example")
    end

    it 'money available' do
      expect(player.pot).to eq(200)
    end

  end

  describe '#make_bet' do

    it 'raises error if too big of a bet' do
      expect{ player.make_bet(201) }.to raise_error("You don't have enough money!")
    end

    it 'deducts bet from the players available funds' do
      player.make_bet(50)
      expect(player.pot).to eq(150)
    end
  end

  describe '#discard_card' do
    # it 'asks user to remove up to three cards' do
    #   expect(player).to receive(:discard_card).with(Array)
    # end

    it 'removes the chosen cards from the players hand' do
      player.hand = ["a", "b", "c", "d", "e"]
      player.discard_card([1, 2])
      expect(player.hand).to eq(["a", "d", "e"])
    end

    # it 'dealt new cards from the deck to replace their old cards'
  end



end
