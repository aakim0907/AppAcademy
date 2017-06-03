class KnightPathFinder
  def self.valid_moves(current_pos)
    moves = [1, -1, 2, -2]
    possible_moves = moves.permutation(2).to_a
    possible_moves.reject! { |el| el.reduce(:+) == 0 }
    possible_pos = possible_moves.map do |el|
      [el[0] + current_pos[0], el[1] + current_pos[1]]
    end

    possible_pos.select do |pos|
      pos.all? { |el| el.between?(0, 8) }
    end
  end

  attr_reader :visited_positions

  def initialize(start_pos)
    @start_pos = start_pos  # root node
    @visited_positions = [start_pos]
  end

  def new_move_positions(current_pos)
    valid_pos = KnightPathFinder.valid_moves(current_pos)
    new_pos = valid_pos.reject { |pos| @visited_positions.include?(pos) }
    @visited_positions += new_pos
    new_pos
  end

  def build_move_tree
    #push and shift method
    queue = [@start_pos]
    until queue.empty?
      pos = queue.shift
      queue += new_move_positions(pos)
      puts queue
    end
  end

  def find_path
  end
end
