require_relative 'piece'
require_relative 'stepping_piece'

class Knight < Piece
include SteppingPiece

  def initialize(pos, color = :whatever, board)
    super
    @white_symbol = "\u2658"
    @black_symbol = "\u265e"
  end

end
