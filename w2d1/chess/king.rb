require_relative 'piece'
require_relative 'stepping_piece'

class King < Piece
include SteppingPiece

  def initialize(pos, color = :whatever, board)
    super
    @white_symbol = "\u2654"
    @black_symbol = "\u265a"
  end

end
