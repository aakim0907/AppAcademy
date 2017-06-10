require_relative 'card.rb'

class Board
  attr_reader :board

  def self.generate_deck
    cards = (1..8).to_a + (1..8).to_a
    cards.shuffle!
  end

  def self.populate_board(cards)
    grid = Array.new(4) { Array.new(4) { Card.new } }
    grid.each do |row|
      row.each do |card|
        card.face_value = cards.pop
      end
    end
  end

  def initialize
    @cards = Board.generate_deck
    @grid = Board.populate_board(@cards)
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def render
    @grid.each do |row|
      puts row.map(&:card_display).join(' ')
    end
  end

  def flip_card(position)
    card = self[position]
    card.face_toggle
    card
  end

  def won?
    @grid.flatten.all?(&:face_up) # { |card| card.face_up }
  end

end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b.render
  b.flip_card([1, 1])
  b.render
  b.flip_card([1, 2])
  b.render
  b.flip_card([1, 1])
  b.flip_card([1, 2])
  b.render
end
