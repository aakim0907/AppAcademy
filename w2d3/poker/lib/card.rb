class Card
  attr_reader :ranks, :suit, :suit_num

  def initialize(ranks, suit, num)
    @ranks = ranks
    @suit = suit
    @suit_num = num
  end

end
