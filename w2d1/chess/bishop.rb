require_relative 'piece'
require_relative 'sliding_piece'

class Bishop < Piece
include SlidingPiece

  def initialize(pos, color = :whatever, board)
    super
    @white_symbol = "\u2657"
    @black_symbol = "\u265d"
  end

end
