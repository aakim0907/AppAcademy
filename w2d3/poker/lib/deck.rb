require_relative 'card'

class Deck
  attr_reader :deck

  def self.populate
    stack_of_cards = []
    ranks = %w{A 2 3 4 5 6 7 8 9 10 J Q K}
    suits = %w{S H D C}
    suits.each do |suit|
      ranks.size.times do |i|
        stack_of_cards << Card.new(ranks[i], suit, i+1)
      end
    end
    stack_of_cards
  end

  def initialize
    @deck = Deck.populate
  end
end
