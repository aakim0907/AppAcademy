require_relative 'board.rb'
require_relative 'piece.rb'
require_relative 'cursor.rb'
require 'colorize'

class Display
  attr_reader :board
  def initialize(board = Board.new)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def render
    @board.grid.each_with_index do |row, x|
      row.each_with_index do |_, y|
        piece = @board[[x, y]]
        if @cursor.cursor_pos == [x, y]
          if @cursor.selected
            print "#{piece} ".red.on_yellow.blink
            @cursor.toggle_selected
          else
            print "#{piece} ".colorize(:background => :yellow)
          end
        elsif x.even?
          if y.even?
            print "#{piece} ".colorize(:background => :white)
          else
            print "#{piece} ".colorize(:background => :blue)
          end
        else
          if y.even?
            print "#{piece} ".colorize(:background => :blue)
          else
            print "#{piece} ".colorize(:background => :white)
          end
        end
      end
      puts "\n"
    end
    return ""
  end

  def play
    while true
      render
      @cursor.get_input
    end
  end

end
