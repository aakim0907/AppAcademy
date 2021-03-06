class Piece
  attr_reader :symbol, :start_pos, :board, :color
  attr_accessor :current_pos

  def initialize(pos, color = :whatever, board)
    @board = board
    @color = color
    @start_pos = pos
    @current_pos = @start_pos
    @white_symbol = "\u265d"
    @black_symbol = "\u2657"
  end

  def to_s
    @color == :black ? @black_symbol : @white_symbol
  end

  def same_team?(pos)
    piece = @board[pos]
    piece.color == @color
  end

  def moves
  end

  def valid_moves
    moves.reject { |pos| move_into_check?(pos) }
  end

  def move_into_check?(end_pos)
    board2 = board.dup
    board2.move_piece(start_pos, end_pos)
    board2.in_check?(@color)
  end

  def double
    dup
  end

end

class NullPiece < Piece

  def to_s
    " "
  end

end
