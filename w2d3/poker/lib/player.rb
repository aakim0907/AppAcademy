class Player
  attr_reader :name
  attr_accessor :pot, :hand

  def initialize(name)
    @name = name
    @pot = 200
    @hand = []
  end

  def make_bet(amount)
    raise "You don't have enough money!" if amount > @pot
    @pot -= amount
    #update game pot
  end

  def discard_card(card_idx)
    discarded_cards = card_idx.map { |el| @hand[el] }
    @hand -= discarded_cards
    # replace with new cards from deck
  end

end
